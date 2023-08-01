#!/bin/sh
dnf upgrade -y \
&& dnf install -y vim-enhanced ansible jq pipx nodejs fzf git \
&& npm install -g npm \
&& ansible-playbook ~/.vim/site.yaml \
&& tests/run.sh
