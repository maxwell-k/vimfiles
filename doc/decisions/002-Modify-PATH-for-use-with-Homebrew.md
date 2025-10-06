# 002 Modify PATH for use with Homebrew

<!--
doc/decisions/002-modify-PATH-for-use-with-homebrew.md
Copyright Keith Maxwell
SPDX-License-Identifier: CC0-1.0
-->

## Context

- `site.yaml` conditionally installs certain files into `~/.local/bin`
- these files are necessary for the test suite to pass so this process:
- (1) manually downloads `~/.zshenv` to set PATH and
- (2) manually creates `~/.local/bin`

## Alternatives

1. Adopt a `~/.zshenv` file from <https://github.com/maxwell-k/dotfiles/>
2. Edit `/etc/zsh/zshenv` to ensure PATH includes `~/.local/bin`

Alternative 1:

- introduces a dependency on another repository
- set PATH early enough that on MacOS the order will be changed by `path_helper`

## Decision

~~Initial decision was (1).~~

Implement (2) using `tests/manual/incus-ubuntu-24.04-homebrew.yaml`.

<!-- vim: set filetype=markdown.htmlCommentNoSpell : -->
