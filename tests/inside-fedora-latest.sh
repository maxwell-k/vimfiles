#!/bin/sh
dnf upgrade -y \
&& dnf install -y vim-enhanced ansible jq pipx nodejs fzf git \
&& jq -n '.all.hosts.localhost = null' \
| jq '.all.vars.ansible_python_interpreter = "python3"' \
| jq '.all.vars.ansible_connection = "local"' \
> /etc/ansible/hosts \
&& ansible-playbook ~/.vim/site.yaml \
&& tests/run.sh
