#!/bin/sh
dnf upgrade -y \
&& dnf install -y vim-enhanced ansible jq pipx nodejs fzf git \
&& ansible-playbook ~/.vim/site.yaml \
&& tests/run.sh
