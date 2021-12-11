"""Check that file types are detected correctly

Usage:

    python3 tests/file-type-detection.py

"""
from pathlib import Path
from subprocess import check_call


ROOT = Path(__file__).parent
DATA = ROOT / "file-type-detection"
OUTPUT = ROOT / 'file-type-detection.txt'

def clean(before: str) -> str:
    after = before.removeprefix("# ")
    after = after.removeprefix("// ")
    return after

if __name__ == "__main__":

    assert clean("# python") == "python"
    assert clean("// javascript") == "javascript"

    issues = 0
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
            expected = clean(file.read().strip())
        with open(OUTPUT) as file:
            actual = file.read().strip().removeprefix('filetype=')
        if expected != actual:
            print(f"{expected!r} != {actual!r} for {path}")
            issues += 1
    exit(issues)
