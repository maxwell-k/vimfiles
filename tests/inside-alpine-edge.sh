#!/bin/sh
apk add vim npm ansible git beancount \
&& npm install -g npm \
&& ansible-playbook site.yaml \
&& tests/run.sh
