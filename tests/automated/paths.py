#!/usr/bin/env python
# tests/automated/paths.py
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
"""Check each file includes its path."""

from pathlib import Path
from subprocess import run
from tomllib import load


def _main() -> int:

    with Path("REUSE.toml").open("rb") as f:
        tables = load(f).get("annotations", [])

    excluded = [i for table in tables for i in table.get("path", [])]

    result = run(["/usr/bin/git", "ls-files"], capture_output=True, check=True)
    paths = [Path(i) for i in result.stdout.decode().splitlines() if i not in excluded]

    files = [path for path in paths if _include(path)]
    missing = [path for path in files if str(path) not in path.read_text()]
    for i in missing:
        print(str(i))

    unordered = [i for i in set(files) - set(missing) if not _ordered(i)]
    for i in unordered:
        print(str(i))

    if missing or unordered:
        return 1

    return 0


def _ordered(path: Path) -> bool:
    lines = path.read_text().splitlines()
    # Assume the first time the path appears that it should be above the
    # copyright header
    first = next(index for index, line in enumerate(lines) if str(path) in line)
    try:
        result = "Copyright" in lines[first + 1]
    except IndexError:
        result = False
    return result


def _include(path: Path) -> bool:
    """Determine if path should be included in checks."""
    return not (
        not path.is_file()
        or path.name == ".en.utf-8.add"
        or "fixtures" in path.parts
        or path.parts[0] == "LICENSES"
        or path.with_name(path.name + ".license").is_file()
    )


if __name__ == "__main__":
    raise SystemExit(_main())
