"
" ftplugin/isort.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use as set filetype=python.black.isort
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['isort']
" https://pycqa.github.io/isort/docs/configuration/black_compatibility/
" https://black.readthedocs.io/en/stable/compatible_configs.html#isort
let g:ale_python_isort_options = '--profile black'
