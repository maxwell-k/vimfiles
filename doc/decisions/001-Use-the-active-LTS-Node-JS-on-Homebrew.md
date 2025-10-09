# 001 Use the active LTS Node JS on Homebrew

<!--
doc/decisions/001-Use-the-active-LTS-Node-JS-on-Homebrew.md
Copyright Keith Maxwell
SPDX-License-Identifier: CC0-1.0
-->

## Context

Node 22 is the [active] long term support version and the [default] version on
Fedora Linux 41. [For homebrew] the current stable default is 23. Odd numbered
versions become unsupported by upstream after six months.

[active]: https://nodejs.org/en/about/previous-releases
[default]: https://packages.fedoraproject.org/pkgs/nodejs22/nodejs/
[For homebrew]: https://formulae.brew.sh/formula/node#default

It is possible to install Node 22 with `brew` however it adds complexity; the
install command outputs the following

    node@22 is keg-only, which means it was not symlinked into /home/linuxbrew/.linuxbrew,
    because this is an alternate version of another formula.

    If you need to have node@22 first in your PATH, run:
      echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@22/bin:$PATH"' >> ~/.zshrc

    For compilers to find node@22 you may need to set:
      export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/node@22/lib"
      export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/node@22/include"

## Alternatives

Options include:

1. use Node 23
2. use Node 22 and modify `PATH` as suggested
3. use Node 22 and symlink the binaries onto `PATH` somewhere

## Decision

~~For now I've decided to try and use Node 23 — option 1.~~

For now I've decided to try and use option 3.

<!-- vim: set filetype=markdown.htmlCommentNoSpell : -->
