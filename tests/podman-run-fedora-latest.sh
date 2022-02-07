#!/bin/sh

# `--privileged` is added below to avoid the error `getaddrinfo() thread failed
# to start` when connecting to an internet resource:

# ~/.local/bin is normally added to PATH by from ~/.bashrc, see
# /etc/skel/.bashrc. ~/.bashrc is not sourced when running Ansible plays.

podman run \
  --rm \
  --tty \
  --privileged \
  --volume="$PWD":/root/.vim:Z \
  --workdir=/root/.vim \
  --env=PATH=/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin \
  fedora:latest \
  tests/inside-fedora-latest.sh
