#!/usr/bin/env python
"""Check each file includes its path."""
# tests/automated/paths.py
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0

from subprocess import run
from pathlib import Path
from tomllib import load

REUSE = Path("REUSE.toml")


def _read_reuse() -> list[Path]:
    with REUSE.open("rb") as f:
        data = load(f)

    annotations = data.get("annotations", [])

    return [
        Path(path) for annotation in annotations for path in annotation.get("path", [])
    ]


def _include(path: Path, ignored: list[Path]) -> bool:
    return not (
        not path.is_file()
        or path.name == ".en.utf-8.add"
        or "file-type-detection" in path.parts
        or path in ignored
        or path.parts[0] == "LICENSES"
        or path.with_name(path.name + ".license").is_file()
    )


def _main() -> int:

    reuse = _read_reuse()

    result = run(["/usr/bin/git", "ls-files"], capture_output=True, check=True)
    paths = map(Path, result.stdout.decode().splitlines())
    files = [path for path in paths if _include(path, reuse)]
    missing = [file for file in files if str(file) not in file.read_text()]
    for i in missing:
        print(str(i))

    if missing:
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(_main())
