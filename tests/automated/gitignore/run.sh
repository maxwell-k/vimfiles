#!/bin/sh
# tests/automated/bean-format/run.sh
# Copyright 2021 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
# For debugging use `:Vader` instead of `:Vader!`
vim "+packadd vader | Vader! sort.vader"
