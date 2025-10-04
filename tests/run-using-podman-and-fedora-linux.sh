#!/bin/sh

# ~/.local/bin is normally added to PATH by from ~/.bashrc, see
# /etc/skel/.bashrc. ~/.bashrc is not sourced when running Ansible plays.

podman run \
  --rm \
  --tty \
  --volume="$PWD":/root/.vim:Z \
  --workdir=/root/.vim \
  --env=PATH=/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin \
  fedora:latest \
  sh -c "dnf upgrade --assumeyes \
    && dnf install --assumeyes vim-enhanced ansible jq nodejs fzf git uv \
    && ansible-playbook site.yaml \
    && tests/run"
# tests/run-on-fedora-linux-latest-with-podman.sh
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
