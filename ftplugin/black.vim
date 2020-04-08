" ftplugin/black.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use as set filetype=python.black
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['black']
