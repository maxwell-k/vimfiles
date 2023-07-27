<!--
README.md
Copyright 2020 Keith Maxwell
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# maxwell-k/vimfiles

## Quick start

Clone this repository and its sub-modules as `~/.vim`:

    git clone --recurse-submodules https://codeberg.org/maxwell-k/vimfiles.git ~/.vim

Install the appropriate system packages, run the playbook and test the
configuration. See [inside-alpine-edge.sh](tests/inside-alpine-edge.sh) and
[inside-fedora-latest.sh](tests/inside-fedora-latest.sh) for examples.

Set up pre-commit hooks:

    git -C ~/.vim config core.hooksPath ~/.vim/hooks

Further details about testing are in [`tests/README.md`](tests/README.md).

## Supported operating systems

Regularly tested on Alpine Linux and Fedora. Infrequently tested on Debian,
Ubuntu and Mac OS.

## Contents

This repository contains about 1,300 lines of vim script accumulated since 2012.
Much of it will not be of interest to anyone but the original author; a few
"features" may be:

- Complete syntax files for SQLite and Visual Basic for Applications (VBA)
  written from scratch.
- A plugin for interacting with a https://jupyter.org kernel inspired by
  https://github.com/ivanov/vim-ipython
- A file type plugin for automatically committing to Git
- A few extra linters and fixers for https://github.com/dense-analysis/ale

## Decisions

1. Testable in Linux containers
2. Ansible playbook that does not use admin privileges
3. Name the repository `vimfiles`

### Testable in Linux containers manually

There are additional costs — time and resource — to setting up a continuous
integration (CI) system. Codeberg, the solution I've chosen for git hosting,
does not have a preferred CI system, [only a beta] for Woodpecker. There's a
risk I'll implement one system and then, later I will need to implement another.
Configuring a CI system is not time well spent right now. Today the costs or
running CI outweigh the benefits.

[only a beta]: https://codeberg.org/Codeberg/Community/issues/78

Regularly running tests manually inside a Linux container ensures that tests
pass on a fresh system install.

### Ansible playbook that does not use admin privileges

_A limited amount of user-specific configuration is in scope for this
repository, so that it is more valuable independently._

It is helpful to store some configuration tasks, for example generating help
tags, alongside the vim script. I prefer to use Ansible for configuration.

No configuration tasks stored in this repository should use administrator
privileges. System configuration is out of scope for this repository.

### Name the repository `vimfiles`

Vim help uses `vimfiles` as an alternative to `.vim`, see `:help vimfiles`. The
string `dotvim` does is only incidentally mentioned in `:help`.

There's a comparable number of repositories on GitHub called `dotvim` and
`vimfiles`. More are called `dotvim`, but better known authors use `vimfiles`.

Overall I prefer the name `vimfiles`.

## Git configuration

This repository uses approximately twenty git sub-modules. It may be helpful to
set `git config diff.ignoreSubmodules dirty` so that `git status` completes
quickly.

<!-- vim: set filetype=markdown : -->
