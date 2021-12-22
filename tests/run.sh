#!/bin/sh
# tests/run.sh
# Copyright 2020 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0

# If run as `sh tests/run.sh` from the root of the repository
test -d automated || cd tests || exit

for i in automated/* ; do
  cd "$i" || exit 1
  if ! ./run.sh ; then
    printf '%s tests failed\n' "$i"
    exit 1
  fi
  cd ../.. || exit 1
done
