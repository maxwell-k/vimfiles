#!/usr/bin/env python3
# test/automated/dotfiles.py
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
#
"""Run doctests."""

from contextlib import chdir
from pathlib import Path
from subprocess import run

PATHS = [
    Path("bin/vimj.py"),
    Path("bin/tomlv.py"),
]


def main() -> int:
    """Run doctest --verbose on PATHS."""
    cmd = ("git", "rev-parse", "--show-toplevel")
    result = run(cmd, check=True, capture_output=True)
    repository = Path(result.stdout.decode().strip())
    for path in PATHS:
        with chdir(repository / path.parent):
            cmd = ("python", "-m", "doctest", "--verbose", path.name)
            run(cmd, check=True)
            for pyc in Path("__pycache__").iterdir():
                pyc.unlink()

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
