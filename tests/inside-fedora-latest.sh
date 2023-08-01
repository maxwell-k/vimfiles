#!/bin/sh
dnf upgrade --assumeyes \
&& dnf install --assumeyes vim-enhanced ansible jq pipx nodejs fzf git \
&& npm install --global npm \
&& ansible-playbook site.yaml \
&& tests/run.sh
