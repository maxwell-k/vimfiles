#!/bin/sh
# Integration test for pyright ALE linter
#
# Added to ensure diagnostics remain functional when upgrading pyright.
#
# tests/automated/pyright.sh
# Copyright 2026 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
vim \
  "+autocmd User ALELintPost echom 1" \
  "+execute 'edit '.tempname()" \
  "+set filetype=python" \
  "+let b:ale_linters = ['pyright']" \
  "+normal ia: str = 1" \
  "+call test#QuitWithErrorIfLoclistEmpty(5000)"
