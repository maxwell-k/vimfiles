#!/bin/sh
# tests/automated/todo/run.sh
# Copyright 2025 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
# For debugging use `:Vader` instead of `:Vader!`
vim "+packadd vader | Vader! run.vader"
