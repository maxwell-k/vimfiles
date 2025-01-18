#!/bin/sh
# tests/automated/backlog/run.sh
# Copyright Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
# For debugging use `:Vader` instead of `:Vader!`
vim "+packadd vader | Vader! run.vader"
