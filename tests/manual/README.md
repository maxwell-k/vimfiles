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
- [Profile for testing using Incus, Ubuntu 24.04 and Homebrew](#profile-for-testing-using-incus-ubuntu-2404-and-homebrew)
- [Testing using Incus and Fedora 41](#testing-using-incus-and-fedora-41)

<!-- tocstop -->

## Example Markdown file

Command to view example Markdown file:

    vim tests/manual/example.md

## Example todo file

Command to view example [todo] file:

    vim tests/manual/todo.txt

## Profile for testing using Incus, Ubuntu 24.04 and Homebrew

Commands to launch a container, wait for it to start, clear any stored SSH host
keys, mount this directory and set up `~/.terminfo` — see also [this Ghostty
documentation]:

    incus launch images:ubuntu/24.04/cloud c1 < \
      tests/manual/incus-ubuntu-24.04-homebrew.yaml \
    && incus exec c1 -- \
        sh -c "until systemctl is-system-running >/dev/null 2>&1 ; do : ; done" \
    && ssh-keygen -R c1.incus \
    && incus config device add c1 vimfiles disk source=$PWD path=$PWD shift=true \
    && infocmp -x | ssh c1.incus -- tic -x -

Command to connect:

    ssh c1.incus

Install Homebrew following <https://brew.sh/>; including adding to `~/.zshrc`

Commands to install required prerequisites and to symlink `node` and `npm` to
Node JS 22:

    brew install ansible uv node@22 \
    && cd /home/linuxbrew/.linuxbrew/opt/node@22/bin \
    && ln -s $PWD/node $PWD/npm ~/.local/bin \
    && node --version

Command to run the Ansible playbook:

    ansible-playbook ~/.vim/site.yaml

Commands to run the automated test suite:

    cd ~/.vim && sh tests/run.sh

## Testing using Incus and Fedora 41

Commands to launch a container, wait for it to start, start the SSH daemon,
mount this directory, clear any stored SSH host keys, mount this directory and
clear any stored SSH host keys:

    incus launch images:fedora/41/cloud c1 < \
      tests/manual/incus-fedora-41.yaml \
    && incus exec c1 -- \
        sh -c "until systemctl is-system-running >/dev/null 2>&1 ; do : ; done" \
    && incus exec c1 -- systemctl start sshd.service
    && incus config device add c1 vimfiles disk source=$PWD path=$PWD shift=true \
    && ssh-keygen -R c1.incus

Command to set up `~/.terminfo` — see also [this Ghostty documentation]:

    infocmp -x | ssh c1.incus -- tic -x -

Command to connect:

    ssh c1.incus

Command to run the Ansible playbook:

    ansible-playbook ~/.vim/site.yaml

Commands to run the automated test suite:

    cd ~/.vim && sh tests/run.sh

[todo]: http://todotxt.org/
[this Ghostty documentation]:
  https://ghostty.org/docs/help/terminfo#copy-ghostty's-terminfo-to-a-remote-machine
