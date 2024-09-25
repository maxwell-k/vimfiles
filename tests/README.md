<!-- vim: set filetype=markdown.embedme : -->
<!--
   tests/README
   Copyright 2020 Keith Maxwell
   SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Introduction

This folder contains tests for vim. Some are written using `vader`. `vader` is
installed as a git sub-module. To run all of these use `./run.sh`.

Some tests will require `uv` or `npm` to pass. Isolation between tests is
achieved by re-starting vim.

The layout uses a directory for `automated` tests so that it is easy to add a
manual test separately. It is better to have a manual test than no test.

## Vader

### Usage

- Run inside vim: `:packadd vader | Vader %`
- Run from command line: `vim '+packadd vader | Vader! run.vader'`
- Run all tests: `sh run.sh`

Examples are in `pack/submodules/opt/vader/test/vader.vader`

### Authoring notes

- Avoid Before and After because the can impact on included files
- Move buffers with `:buffer` in an Execute block

## Structure

Each set of automated tests is laid out in a directory under `./automated`.

`run.sh` in each directory will run the tests.

# Test in a container

All commands in this section are run from the root of this repository.

    . tests/podman-run-alpine-edge.sh

`podman-run-alpine-edge.sh` and `alpine-edge.sh` in full:

<!-- embedme podman-run-alpine-edge.sh -->

```sh
#!/bin/sh
podman run \
  --rm \
  --tty \
  --volume="$PWD":/root/.vim:Z \
  --workdir=/root/.vim \
  --env=PATH=/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin \
  alpine:edge \
  tests/inside-alpine-edge.sh

```

<!-- embedme inside-alpine-edge.sh -->

```sh
#!/bin/sh
apk add vim npm ansible git beancount \
&& npm install -g npm \
&& ansible-playbook site.yaml \
&& tests/run.sh

```

A similar pair of files tests on the latest stable release of Fedora
`podman-run-fedora-latest.sh` and `inside-fedora-latest.sh`.
