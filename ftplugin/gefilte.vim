" ftplugin/gefilte.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
let b:ale_python_flake8_options = '--max-line-length=88'
let b:ale_python_flake8_options .= ' --ignore=E203,W503,F821'
let b:ale_linters = ['flake8']
