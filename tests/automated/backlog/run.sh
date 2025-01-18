#!/bin/sh
# tests/automated/backlog/run.sh
# Copyright Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
# For debugging use `:Vader` instead of `:Vader!`
cd ../../../pack/vendored/start/backlog/tests/ || exit 1
vim "+packadd vader | Vader! run.vader"
cd "$OLDPWD" || exit 1
