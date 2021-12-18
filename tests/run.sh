#!/bin/sh
# tests/run.sh
# Copyright 2020 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
#
for i in automated/* ; do
  cd "$i" || exit 1
  sh run.sh || { printf '%s tests failed\n' "$i" ; exit 1 ; }
  cd ../.. || exit 1
done
