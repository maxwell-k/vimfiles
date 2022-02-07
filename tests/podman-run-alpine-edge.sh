#!/bin/sh
podman run \
  --rm \
  --tty \
  --volume="$PWD":/root/.vim:Z \
  --workdir=/root/.vim \
  --env=PATH=/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin \
  alpine:edge \
  tests/inside-alpine-edge.sh
