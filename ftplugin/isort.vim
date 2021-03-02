"
" ftplugin/isort.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use as set filetype=python.black.isort
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['isort']
" https://black.readthedocs.io/en/stable/compatible_configs.html#isort
let g:ale_python_isort_options =
  \ '-m 3'
  \ . ' --trailing-coma'
  \ . ' --use-parenthesis'
  \ . ' --ensure-newline-before-comments'
  \ . ' --force-grid-wrap 0'
  \ . ' --line-length 88'
