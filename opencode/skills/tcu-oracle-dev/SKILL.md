---
name: tcu-oracle-dev
description: Investigate TCU development Oracle databases with bounded, read-only SQL using python-oracledb. Use to inspect tables, columns, constraints, relationships, and Fiscalis or eControle records, including creation metadata and imports.
---

# TCU Oracle development

## Scope and domain

- Fiscalis is the legacy inspection system; eControle is the new system and calls inspections control actions.
- Do not assume schemas, table names, relationships, or that both systems use the same database. Discover the actual structures and ask which system is relevant when unclear.
- Team membership and access grants do not establish who created a record. Find actual creation/audit metadata and confirm its meaning from comments, relationships, or application code.
- Default to development, read-only investigation. Never switch environments or schemas beyond the user's request.

## Local dependencies

This skill's directory contains:

```text
SKILL.md
.gitignore
requirements.txt
scripts/setup.sh
scripts/query.py
scripts/query.sh
.venv/                 # Local, ignored by Git; created by setup
```

- Requires Python 3.10 or later and `uv` on PATH. Setup uses `uv venv` and `uv pip install`; neither system `ensurepip` nor pip inside the venv is required. `requirements.txt` pins the direct dependency, python-oracledb (installed/imported as `oracledb`); transitive dependencies are not locked.
- Use `scripts/query.sh` for this environment: the account's password verifier is incompatible with Thin mode (DPY-3015). The launcher activates Thick mode using Oracle Instant Client Basic 19.32, installed outside Git at `~/.local/share/oracle/instantclient_19_32`. Override its directory with `ORACLE_INSTANT_CLIENT_DIR` if needed. No Java, JDBC, or SQL*Plus is required.
- The raw Python helper still defaults to Thin unless `--thick` is provided. Thin requires Oracle Database 12.1 or later; Oracle Client 19 supports database versions from 11.2. Do not infer server version from client version.
- On Ubuntu 24.04.5 x86-64, the client uses the system `libaio1t64` package. A local `libaio.so.1` symlink in the client directory points to `/usr/lib/x86_64-linux-gnu/libaio.so.1t64.0.2`. Recheck that target after system upgrades. No system libraries or global shell configuration were changed.
- The downloaded Basic ZIP was `instantclient-basic-linux.x64-19.32.0.0.0dbru.zip`, from Oracle's official download service, verified against published SHA256 `1749ca1eb5f75b038f2b7ce0abc42eb4575928159259fc4fc851c54a8ca7b002`. Native binaries are not installed by setup.sh or committed to Git; a fresh machine needs a separate authorized client installation.
- If server version, authentication, certificates, or network security requirements are incompatible, report the blocker. Do not weaken TLS, encryption, or authentication.
- Resolve script paths relative to this SKILL.md, not the current working directory. When accessed through a symlink, prefer the physical skill directory consistently.
- Setup changes the local environment and downloads packages. Run only when the user explicitly authorizes dependency installation:

```sh
sh /absolute/path/to/tcu-oracle-dev/scripts/setup.sh
```

- Execute queries through `sh /absolute/path/to/tcu-oracle-dev/scripts/query.sh`, which uses this skill's `.venv/bin/python`. Never silently fall back to global Python or install dependencies during a query. The launcher sets LD_LIBRARY_PATH only for its child process, before Python starts; do not set ORACLE_HOME for Instant Client.
- Do not commit the venv. Recreate it after moving the directory or changing the underlying Python installation. It contains dependencies, not credentials, code, or query results.

## Credentials

The runtime credential file is `~/code/secrets/tcu/oracle-sql-credentials.secret`, outside this repository. Do not read it until a database operation is requested. Never print it, source it as shell code, or expose values in tool arguments, logs, reports, documentation services, or exception messages.

The helper expects a UTF-8 JSON object with exactly three nonempty string fields:

```json
{
  "user": "READ_ONLY_ACCOUNT",
  "password": "REPLACE_LOCALLY",
  "dsn": "HOST:1521/SERVICE_NAME"
}
```

These are placeholders, not actual connection details. Use an Oracle Python DSN, not a JDBC URL. The helper accepts the credential file regardless of its permission mode; owner-only permissions are not required. Do not change its permissions or create or overwrite the user's secret file automatically.

If the existing secret uses another format, inspect only its structure without exposing values and adapt parsing as needed. Do not execute it or guess credentials. Wallets or other connection options need explicit implementation; this helper does not currently configure them.

Use a database account with only the required read privileges. Neither the helper's SELECT guard nor a read-only transaction is a complete security boundary: SELECT can invoke functions with side effects, including autonomous transactions. Never invoke unknown application functions or packages.

## Investigation workflow

1. Establish the question, system, environment, and authorized schemas. Consult current official Oracle/python-oracledb documentation through Context7 for API or SQL/version-specific details, without sending internal data or credentials.
2. Verify connectivity with a minimal SELECT such as `SELECT 1 AS OK FROM DUAL`; establish database/session time and timezone when relevant. Do not connect merely because this skill was loaded.
3. Discover metadata before querying business data. Prefer USER_* or ALL_* dictionary views, including ALL_TABLES, ALL_TAB_COLUMNS, ALL_TAB_COMMENTS, ALL_COL_COMMENTS, ALL_CONSTRAINTS, and ALL_CONS_COLUMNS. Scope metadata searches to the relevant owner/table patterns and inspect constraints before joining. Do not request DBA privileges or perform broad dictionary dumps.
4. Distinguish DATE, TIMESTAMP, and timezone-aware types. For "today", establish the intended calendar date and timezone; use explicit start-inclusive/end-exclusive bounds. Do not assume the workstation, application, and database share a timezone.
5. Use explicit projections, bind parameters for values, narrowly scoped predicates, and stable ordering. Never concatenate untrusted identifiers; choose schema/table/column names from verified metadata. Preserve formatted business identifiers and leading zeros.
6. Use the supplied helper for queries. It starts a read-only transaction, sets a per-round-trip timeout, bounds fetched rows, reports truncation, and rolls back. The default is 50 rows; the hard maximum is 1000. These are client fetch limits, not guarantees on server-side work. Also bound SQL work where appropriate. Avoid expensive sorts, scans, and aggregates without evaluating scope.
7. If results are truncated, report that explicitly. Retrieve further pages only as needed using stable, verified keys, not unbounded exports. Do not equate no visible results with nonexistence: check schema visibility, identifiers, case, predicates, dates, and actual relationships.
8. Report owner/table, criteria, identifiers, relevant evidence, and limitations. Separate observed values from hypotheses about application behavior. For imports, confirm selection/transformation rules in code where available; database contents alone do not prove them.

## Query helper

Supply a single SELECT on stdin or with `--sql-file`. Do not include a trailing semicolon. CTEs, SELECT INTO, and FOR UPDATE are deliberately unsupported. Use JSON `--binds-file` for bind values; it must contain an object, not executable code. Bind values currently support JSON scalar types, not typed datetime objects; use explicit conversions when required.

```sh
sh /absolute/path/to/tcu-oracle-dev/scripts/query.sh <<'SQL'
SELECT 1 AS OK FROM DUAL
SQL
```

Output is JSON with separate `columns` and `rows` arrays (preserving duplicate column names), `returned_rows`, and `truncated`. Dates use ISO strings; binary scalars use tagged base64. LOB/LONG/object/cursor columns are rejected: select a deliberately bounded scalar projection instead of dumping them. Other unsupported result types may need explicit SQL conversion. The timeout defaults to 15000 ms per round trip, not a total wall-clock deadline; the maximum is 60000 ms. TCP connection timeout is 10 seconds per connection attempt, not a whole-command deadline.

## Safety

- No DML, DDL, procedure execution, imports, database links, unknown SQL functions, or privilege changes. This helper is intentionally not an administrative SQL console.
- Do not change data even if the user requests it through this investigation skill; establish a separate authorized operation and appropriate tooling first.
- Keep credentials and results out of the skill directory and Git. Default to minimal redacted summaries; return complete records only when explicitly requested and authorized.
- Temporary SQL, bind files, or authorized exports belong under `/tmp/opencode` with owner-only permissions. Do not persist raw results unless necessary and authorized. Never put credentials in temporary files.
- No automatic connection on load, no automatic installation, no raw database exception messages, and no security bypasses.
