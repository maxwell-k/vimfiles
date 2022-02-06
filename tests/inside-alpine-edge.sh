#!/bin/sh
apk add vim npm ansible git beancount \
&& ansible-playbook -i, site.yaml \
&& tests/run.sh
