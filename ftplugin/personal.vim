" ftplugin/personal.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Python filetype settings for working on personal Python code
"
" Use as set filetype=python.black.personal
let b:ale_python_black_options = '--line-length 79'
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['isort']
