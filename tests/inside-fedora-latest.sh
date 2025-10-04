#!/bin/sh
dnf upgrade --assumeyes \
&& dnf install --assumeyes vim-enhanced ansible jq nodejs fzf git \
&& ansible-playbook site.yaml \
&& tests/run
