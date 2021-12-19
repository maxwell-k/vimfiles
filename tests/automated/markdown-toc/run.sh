#!/bin/sh
# tests/automated/markdown-toc/run.sh
# Copyright 2021 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
cp missing.md example.md \
&& vim \
  "+edit example.md" \
  '+normal \aq' \
&& git diff --exit-code example.md
