"""Check that file types are detected correctly

Usage:

    python3 tests/file-type-detection.py

Only uses the standard library. Includes tests of test code inline.
"""
from pathlib import Path
from subprocess import check_call


TESTS = Path(__file__).parent
DATA = TESTS / "file-type-detection"
OUTPUT = TESTS / 'file-type-detection.txt'


def issues() -> int:
    result = 0
    for path in DATA.rglob("*"):

        if not path.is_file():
            continue

        command = (
            "vim",
            f"+redir! > {OUTPUT}",
            "+set filetype?",
            "+quit",
            path,
        )
        if check_call(command) != 0:
            print(f"Error running {command}")

        with path.open() as file:
            expected = clean_expected(file.read())
        with open(OUTPUT) as file:
            actual = clean_actual(file.read())
        if expected != actual:
            print(f"{expected!r} != {actual!r} for {path}")
            result += 1
    return result


def clean_expected(before: str) -> str:
    after = before.strip()
    after = after.removeprefix("# ")
    after = after.removeprefix("// ")
    return after


def clean_actual(before: str) -> str:
    after = before.strip()
    after = after.removeprefix('filetype=')
    return after


if __name__ == "__main__":
    assert clean_actual('\n  filetype=groovy') == "groovy"
    assert clean_expected("text\n") == "text"
    assert clean_expected("# python") == "python"
    assert clean_expected("// javascript") == "javascript"

    exit(min(issues(), 1))
