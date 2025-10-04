<!-- vim: set filetype=markdown.markdown-toc : -->
<!--
tests/manual/README.md
Copyright 2020 Keith Maxwell
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Manual tests

<!-- toc -->

- [Example Markdown file](#example-markdown-file)
- [Example todo file](#example-todo-file)
- [Testing using Incus](#testing-using-incus)
  - [Fedora 42](#fedora-42)
  - [Ubuntu 24.04 and Homebrew](#ubuntu-2404-and-homebrew)

<!-- tocstop -->

## Example Markdown file

Command to view example Markdown file:

    vim tests/manual/example.md

## Example todo file

Command to view example [todo] file:

    vim tests/manual/todo.txt

[todo]: http://todotxt.org/

## Testing using Incus

_The commands below assume that the working directory is `tests/manual` inside
this repository._

For further details about configuring the terminal description see also [this
Ghostty documentation].

[this Ghostty documentation]:
  https://ghostty.org/docs/help/terminfo#copy-ghostty's-terminfo-to-a-remote-machine

### Fedora 42

Commands to launch a container, wait for it to start, mount `~/.vim`, configure
the terminal description and run the Ansible playbook:

    incus launch images:fedora/42/cloud c1 < incus-fedora-42.yaml \
    && incus exec c1 -- \
        sh -c "until systemctl is-system-running >/dev/null 2>&1 ; do : ; done" \
    && incus config device add \
        c1 vimfiles disk source=$HOME/.vim path=$HOME/.vim shift=true \
    && infocmp -x xterm-ghostty | incus exec c1 -- tic -x - \
    && incus exec c1 -- su maxwell-k --command 'ansible-playbook ~/.vim/site.yaml'

Command to connect:

    incus exec c1 -- su --login maxwell-k

Commands to run the automated test suite:

    cd ~/.vim && tests/run

Commands to clean up:

    incus stop c1 && incus delete c1

### Ubuntu 24.04 and Homebrew

Commands to launch a container, wait for it to start, keys, mount `~/.vim` and
configure the terminal description:

    incus launch images:ubuntu/24.04/cloud c1 < incus-ubuntu-24.04-homebrew.yaml \
    && incus exec c1 -- \
        sh -c "until systemctl is-system-running >/dev/null 2>&1 ; do : ; done" \
    && incus config device add \
        c1 vimfiles disk source=$HOME/.vim path=$HOME/.vim shift=true \
    && infocmp -x xterm-ghostty | incus exec c1 -- tic -x -

Command to connect:

    incus exec c1 -- su --login maxwell-k

Install Homebrew following <https://brew.sh/>; including adding to `~/.zshrc`.

Commands to install necessary prerequisites and to symlink `node` and `npm` to
NodeJS 22:

    brew install ansible uv node@22 \
    && cd /home/linuxbrew/.linuxbrew/opt/node@22/bin \
    && ln -s $PWD/node $PWD/npm ~/.local/bin \
    && node --version

Command to run the Ansible playbook:

    ansible-playbook ~/.vim/site.yaml

Commands to run the automated test suite:

    cd ~/.vim && tests/run

Commands to clean up:

    incus stop c1 && incus delete c1
