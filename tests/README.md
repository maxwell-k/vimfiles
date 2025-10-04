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
- Run from command line: `vim '+packadd vader | Vader!' file.vader`
- Run all tests: `sh run`

For examples from the Vader package itself see:
`pack/submodules/opt/vader/test/vader.vader`

### Authoring notes

- Avoid Before and After because the can impact on included files
- Move buffers with `:buffer` in an Execute block

## Structure

Each set of automated tests is laid out in a directory under `./automated`.

`run` in each directory will run the tests.

# Testing with Linux containers

Command to run the test suite using Podman and the `alpine:latest` image:

    tests/run-using-podman-and-alpine-linux.sh
