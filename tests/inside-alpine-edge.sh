#!/bin/sh
apk add vim npm ansible git beancount \
&& mkdir --parents /etc/ansible \
&& {
  printf '[all]\n' \
  && printf 'localhost' \
  && printf ' ansible_connection=local' \
  && printf ' ansible_python_interpreter=python3' \
  && printf '\n' ; } >>/etc/ansible/hosts \
&& ansible-playbook site.yaml \
&& tests/run.sh
