"
" ftplugin/black.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Python filetype settings for working on black Python code
"
" - black with default configuration
" - flake8 doesn't warn about black formatting
"
" Use as set filetype=python.black
let b:ale_python_black_options = ''
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['black']
" https://black.readthedocs.io/en/stable/compatible_configs.html#flake8
let b:ale_python_flake8_options = '--ignore=E203,W503 --max-line-length=88'
