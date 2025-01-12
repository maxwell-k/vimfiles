#!/bin/sh
podman run \
  --rm \
  --tty \
  --volume="$PWD":/root/.vim:Z \
  --workdir=/root/.vim \
  --env=PATH=/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin \
  --env=ANSIBLE_PYTHON_INTERPRETER=auto_silent \
  alpine:latest \
  tests/inside-alpine-latest.sh
