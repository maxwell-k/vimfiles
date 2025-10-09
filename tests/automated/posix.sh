#!/bin/sh
# tests/automated/posix.sh
# Copyright 2023 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
vim \
  "+set filetype=sh" \
  "+if exists('b:is_kornshell') | cquit | endif" \
  "+if b:is_posix != 1 | cquit | endif" \
  +quit
