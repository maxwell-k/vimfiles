#!/usr/bin/env python3
# test/automated/dotfiles.py
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
#
"""Run doctests."""

import logging
from contextlib import chdir
from pathlib import Path
from subprocess import run

logger = logging.getLogger(__name__)


def main() -> int:
    """Run doctest --verbose on PATHS."""
    logging.basicConfig(level=logging.INFO)

    cmd = ("git", "rev-parse", "--show-toplevel")
    result = run(cmd, check=True, capture_output=True)
    repository = Path(result.stdout.decode().strip())
    cmd = ("git", "ls-files", "*.py")
    result = run(cmd, check=True, capture_output=True, text=True)
    paths = [Path(i) for i in result.stdout.strip().split("\n")]
    logger.info("Iterating over '%s'", paths)
    for path in paths:
        directory = repository / path.parent
        logger.info("Entering '%s'", directory)
        with chdir(directory):
            cmd = ("python", "-m", "doctest", "--verbose", path.name)
            logger.info("Running '%s'", cmd)
            run(cmd, check=True)
            pycache = Path("__pycache__")
            for pyc in pycache.iterdir():
                pyc.unlink()
            if pycache.is_dir():
                pycache.rmdir()

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
