"""Offline checks; no driver installation or database access required."""

import json
import os
from pathlib import Path
import tempfile
import unittest

from query import encode_value, load_credentials, validate_sql


class QueryTests(unittest.TestCase):
    def test_select_with_comments_literals_and_binds(self):
        sql = "-- scope\nSELECT 'a;b' AS text FROM DUAL WHERE :value = 1"
        self.assertEqual(validate_sql(sql), sql)

    def test_rejects_non_select_and_unsupported_constructs(self):
        for sql in (
            "DELETE FROM example", "BEGIN NULL; END;", "SELECT 1 FROM DUAL;",
            "SELECT * FROM example FOR UPDATE", "SELECT x INTO y FROM example",
            "WITH x AS (SELECT 1 FROM DUAL) SELECT * FROM x",
            "SELECT q'[text]' FROM DUAL", "",
        ):
            with self.subTest(sql=sql), self.assertRaises(ValueError):
                validate_sql(sql)

    def test_credentials(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "credentials.secret"
            expected = {"user": "test", "password": "dummy", "dsn": "host/service"}
            path.write_text(json.dumps(expected))
            os.chmod(path, 0o600)
            self.assertEqual(load_credentials(path), expected)
            os.chmod(path, 0o644)
            self.assertEqual(load_credentials(path), expected)

    def test_rejects_unsupported_credentials(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "credentials.secret"
            for content in ({}, {"user": "test", "password": "dummy", "dsn": "jdbc:oracle:thin:example"}):
                path.write_text(json.dumps(content))
                os.chmod(path, 0o600)
                with self.assertRaises(ValueError):
                    load_credentials(path)

    def test_binary_encoding(self):
        self.assertEqual(encode_value(b"test"), {"encoding": "base64", "value": "dGVzdA=="})


if __name__ == "__main__":
    unittest.main()
