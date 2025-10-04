#!/bin/sh
podman run \
  --rm \
  --tty \
  --volume="$PWD":/root/.vim:Z \
  --workdir=/root/.vim \
  --env=PATH=/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin \
  --env=ANSIBLE_PYTHON_INTERPRETER=auto_silent \
  alpine:latest \
  sh -c "apk add vim npm ansible git beancount tar \
    && ansible-playbook site.yaml \
    && tests/run"
# tests/run-on-alpine-linux-latest-with-podman.sh
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
