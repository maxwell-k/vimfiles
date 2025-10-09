#!/usr/bin/env python3
"""Check that file types are detected correctly.

Only uses the standard library. Includes tests of test code inline.
"""
# tests/automated/filetype.py
# Copyright 2021 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
import json
import unittest
from pathlib import Path
from subprocess import run


TESTS = Path(__file__).parent
OUTPUT = TESTS / "run.txt"


def _clean_expected(before: str) -> str:
    try:
        after = json.loads(before)["filetype"]
    except json.decoder.JSONDecodeError:
        after = before.strip()
        after = after.removeprefix("# ")
        after = after.removeprefix("// ")
        after = after.removeprefix("-- ")
    return after


def _clean_actual(before: str) -> str:
    after = before.strip()
    return after.removeprefix("filetype=")


class TestStringMethods(unittest.TestCase):
    """Test using tests/fixtures/."""

    def tearDown(self) -> None:
        """Clean up temporary file."""
        OUTPUT.unlink(missing_ok=True)

    def test_clean_expect(self) -> None:
        """Test the _clean_expect function."""
        self.assertEqual(_clean_actual("\n  filetype=groovy"), "groovy")
        self.assertEqual(_clean_expected("text\n"), "text")
        self.assertEqual(_clean_expected("# python"), "python")
        self.assertEqual(_clean_expected("// javascript"), "javascript")
        self.assertEqual(_clean_expected('{"filetype":"json"}'), "json")

    def test_issues(self) -> None:
        """Call _issues()."""
        result = run(
            ("/usr/bin/git", "rev-parse", "--show-toplevel"),
            check=True,
            capture_output=True,
            text=True,
        )
        fixtures = Path(result.stdout.strip()) / "tests/fixtures/"
        for path in fixtures.rglob("*"):

            if not path.is_file():
                continue

            command = (
                "/usr/bin/vim",
                f"+redir! > {OUTPUT}",
                "+set filetype?",
                "+quit",
                path,
            )
            run(command, check=True)
            expected = _clean_expected(path.read_text())
            actual = _clean_actual(OUTPUT.read_text())
            self.assertEqual(expected, actual)


if __name__ == "__main__":
    unittest.main()
