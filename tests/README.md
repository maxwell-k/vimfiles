<!--
tests/README.md
Copyright 2020 Keith Maxwell
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Introduction

This folder contains tests for vim. Some are written using `vader`. `vader` is
installed as a git sub-module. To run all of these use `./run`.

Some tests will require `uv` or `npm` to pass. Isolation between tests is
achieved by re-starting vim.

The layout uses a directory for `automated` tests so that it is easy to add a
manual test separately. It is better to have a manual test than no test.

## Vader

### Usage

- Run inside vim when editing tests using Vader: `:packadd vader | Vader %`
- Run from command line: `vader`
- Run all tests: `tests/run`

For examples from the Vader package itself see:
`pack/submodules/opt/vader/test/vader.vader`

### Authoring notes

- Avoid Before and After because the can impact on included files
- Move buffers with `:buffer` in an Execute block

## Structure

Each set of automated tests is laid out in a directory under `./automated`.

If tests are a in a directory, `run` will run the tests; if tests are in a file,
the file is executable.
