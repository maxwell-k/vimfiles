#!/usr/bin/env python3
"""Run tests on the embedme fixer."""
# tests/automated/embedme.py
# Copyright 2021 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0

import unittest
from pathlib import Path
from shutil import rmtree
from subprocess import run
from tempfile import mkdtemp

VIM = "/usr/bin/vim"

MISSING = """\
<!-- vim: set filetype=markdown.embedme : -->

<!-- embedme example.sh -->

```sh

```

```sh
# example.sh

```
"""

EXAMPLE = """\
#!/bin/sh
echo "hello world"
"""

EXPECTED = """\
<!-- vim: set filetype=markdown.embedme : -->

<!-- embedme example.sh -->

```sh
#!/bin/sh
echo "hello world"

```

```sh
# example.sh

#!/bin/sh
echo "hello world"

```
"""

EXPECTED_WITHOUT = """\
<!-- vim: set filetype=markdown.embedme : -->

<!-- embedme example.sh -->

```sh
#!/bin/sh
echo "hello world"
```

```sh
# example.sh

#!/bin/sh
echo "hello world"
```
"""


class TestEmbedme(unittest.TestCase):
    """Integration tests."""

    def _write(self, text: str) -> None:
        (self.directory / "example.sh").write_text(text)

    def _read(self) -> str:
        return self.target.read_text()

    def _fix(self) -> None:
        cmd = (
            VIM,
            f"+edit {self.target.name}",
            "+call vim#AleQuit()",
        )
        run(cmd, check=True, cwd=self.directory)

    def setUp(self) -> None:
        """Create the directory and add the "empty" file."""
        self.directory = Path(mkdtemp(dir=str(Path(__file__).resolve().parent)))
        self.target = self.directory / "example.md"
        self.target.write_text(MISSING)

    def test_with_trailing_newline(self) -> None:
        """Test two blocks."""
        self._write(EXAMPLE)
        self._fix()
        self.assertEqual(self._read(), EXPECTED)

    def test_without_trailing_newline(self) -> None:
        """Test two blocks."""
        self._write(EXAMPLE.rstrip("\n"))
        self._fix()
        self.assertEqual(self._read(), EXPECTED_WITHOUT)

    def tearDown(self) -> None:
        """Clear the directory."""
        rmtree(self.directory)


if __name__ == "__main__":
    unittest.main()
