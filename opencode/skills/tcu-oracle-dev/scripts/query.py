#!/usr/bin/env python3
"""Run a bounded SELECT using external credentials and a read-only transaction."""

import argparse
import base64
from datetime import date, datetime
from decimal import Decimal
import json
from pathlib import Path
import re
import sys


DEFAULT_CREDENTIALS = Path.home() / "code/secrets/tcu/oracle-sql-credentials.secret"


def validate_sql(sql):
    """Apply a conservative guard, not a SQL security boundary or full parser."""
    sql = sql.strip()
    if not sql or len(sql) > 100_000:
        raise ValueError("Provide a nonempty SELECT of at most 100000 characters.")
    # Mask literals, quoted identifiers, and comments before checking tokens.
    # Oracle alternative quoting is deliberately unsupported by this helper.
    if re.search(r"\b(?:n?q)'", sql, re.IGNORECASE):
        raise ValueError("Alternative quoted literals are not supported; use binds.")
    masked = re.sub(
        r"'(?:(?:'')|[^'])*'|\"(?:(?:\"\")|[^\"])*\"|--[^\n]*|/\*.*?\*/",
        " ", sql, flags=re.DOTALL,
    )
    if not re.match(r"^\s*SELECT\b", masked, re.IGNORECASE):
        raise ValueError("Only SELECT statements are accepted; CTEs are unsupported.")
    if ";" in masked:
        raise ValueError("Use one SELECT without a trailing semicolon.")
    if re.search(r"\bFOR\s+UPDATE\b|\bINTO\b", masked, re.IGNORECASE):
        raise ValueError("Locking and SELECT INTO are not supported.")
    return sql


def load_credentials(path):
    data = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict) or set(data) != {"user", "password", "dsn"}:
        raise ValueError("Credentials must be a JSON object with user, password, and dsn only.")
    if any(not isinstance(value, str) or not value.strip() for value in data.values()):
        raise ValueError("Credential values must be nonempty strings.")
    if data["dsn"].lower().startswith("jdbc:"):
        raise ValueError("Use an Oracle Python DSN, not a JDBC URL.")
    return data


def encode_value(value):
    if isinstance(value, (date, datetime)):
        return value.isoformat()
    if isinstance(value, Decimal):
        return str(value)
    if isinstance(value, bytes):
        return {"encoding": "base64", "value": base64.b64encode(value).decode("ascii")}
    raise TypeError("Unsupported result type; select explicit scalar columns.")


def positive_int(value):
    number = int(value)
    if number <= 0:
        raise argparse.ArgumentTypeError("Must be positive.")
    return number


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sql-file", type=Path, help="Read SQL from a UTF-8 file; default: stdin")
    parser.add_argument("--binds-file", type=Path, help="Optional JSON object of bind values")
    parser.add_argument("--credentials", type=Path, default=DEFAULT_CREDENTIALS)
    parser.add_argument("--thick", action="store_true", help="Load Oracle Client libraries before connecting")
    parser.add_argument("--max-rows", type=positive_int, default=50)
    parser.add_argument("--timeout-ms", type=positive_int, default=15000)
    args = parser.parse_args(argv)
    if args.max_rows > 1000 or args.timeout_ms > 60000:
        parser.error("Limits: max-rows <= 1000, timeout-ms <= 60000.")
    try:
        sql = validate_sql(args.sql_file.read_text(encoding="utf-8") if args.sql_file else sys.stdin.read())
        binds = json.loads(args.binds_file.read_text(encoding="utf-8")) if args.binds_file else {}
        if not isinstance(binds, dict):
            raise ValueError("Bind values must be a JSON object.")
        credentials = load_credentials(args.credentials.expanduser())
    except (OSError, ValueError) as error:
        # JSON parsing errors can contain fragments of secrets; never echo them.
        message = "Invalid JSON input." if isinstance(error, json.JSONDecodeError) else (
            str(error) if isinstance(error, ValueError) else "Cannot read an input file."
        )
        print(message, file=sys.stderr)
        return 2
    try:
        import oracledb
    except ImportError:
        print("Use this skill's .venv/bin/python; prepare it with sh scripts/setup.sh.", file=sys.stderr)
        return 2
    try:
        if args.thick:
            oracledb.init_oracle_client()
        with oracledb.connect(**credentials, tcp_connect_timeout=10) as connection:
            connection.call_timeout = args.timeout_ms
            try:
                with connection.cursor() as cursor:
                    cursor.execute("SET TRANSACTION READ ONLY")
                    cursor.arraysize = min(args.max_rows + 1, 100)
                    cursor.prefetchrows = 0
                    cursor.execute(sql, binds)
                    # Do not automatically read LOBs or serialize driver objects.
                    unsupported = {
                        oracledb.DB_TYPE_BLOB, oracledb.DB_TYPE_CLOB,
                        oracledb.DB_TYPE_NCLOB, oracledb.DB_TYPE_BFILE,
                        oracledb.DB_TYPE_OBJECT, oracledb.DB_TYPE_CURSOR,
                        oracledb.DB_TYPE_LONG, oracledb.DB_TYPE_LONG_RAW,
                    }
                    if any(column.type_code in unsupported for column in cursor.description):
                        raise ValueError("LOB, LONG, object, and cursor columns require explicit scalar projection.")
                    rows = cursor.fetchmany(args.max_rows + 1)
                    result = {
                        "columns": [column.name for column in cursor.description],
                        "rows": rows[:args.max_rows],
                        "returned_rows": min(len(rows), args.max_rows),
                        "truncated": len(rows) > args.max_rows,
                    }
                    output = json.dumps(result, ensure_ascii=False, default=encode_value, indent=2)
            finally:
                connection.rollback()
        print(output)
        return 0
    except oracledb.Error as error:
        code = getattr(error.args[0], "full_code", "") if error.args else ""
        safe_code = code if re.fullmatch(r"(?:ORA|DPY|DPI)-\d+", code) else "unclassified"
        print(f"Oracle request failed ({safe_code}); details withheld to protect secrets.", file=sys.stderr)
        return 1
    except (TypeError, ValueError) as error:
        print(str(error), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
