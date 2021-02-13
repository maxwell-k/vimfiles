"
" ftplugin/isort.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use as set filetype=python.black.isort
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['isort']
