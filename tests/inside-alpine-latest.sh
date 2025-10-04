#!/bin/sh
apk add vim npm ansible git beancount tar \
&& ansible-playbook site.yaml \
&& tests/run
