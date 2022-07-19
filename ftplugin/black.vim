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
" Configuration to be compatible with flake8, typically stored in .flake8
" https://black.readthedocs.io/en/stable/guides/
" using_black_with_other_tools.html?#flake8
" If required:
" let b:ale_python_flake8_options = '--max-line-length=88 --extend-ignore=E203'
