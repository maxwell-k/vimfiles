#!/bin/sh
# tests/automated/simple-vader/run.sh
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
# For debugging use `:Vader` instead of `:Vader!`
for i in ./*.vader ; do $i ; done
