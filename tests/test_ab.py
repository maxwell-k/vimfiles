#!/usr/bin/env python3
# Tested on Python 3.6.3
from importlib.machinery import SourceFileLoader
from os.path import isfile
from types import ModuleType
from unittest import TestCase, main

from click.testing import CliRunner


class TestClick(TestCase):
    def setUp(self):
        loader = SourceFileLoader("ab", "../roles/script/files/ab")
        module = ModuleType(loader.name)
        loader.exec_module(module)
        self.ab = module.ab

    def test_ab_exit_codes(self):
        runner = CliRunner()
        result = runner.invoke(self.ab, [__file__])
        self.assertEqual(result.exit_code, 0, "Exit code is 0 if file exists")
        self.assertFalse(isfile("does_not_exist"))
        result = runner.invoke(self.ab, ["does_not_exist"])
        self.assertEqual(
            result.exit_code, -1, "Exit code is minus 1 if file does not exist"
        )

    def test_ab_output(self):
        runner = CliRunner()
        result = runner.invoke(self.ab, [__file__])
        self.assertNotEqual(result.output, "", "Output by default")
        result = runner.invoke(self.ab, [__file__, "--print"])
        self.assertNotEqual(result.output, "", "Output with --print")
        result = runner.invoke(self.ab, [__file__, "--no-print"])
        self.assertEqual(result.output, "", "No output with --no-print")


if __name__ == "__main__":
    main()
