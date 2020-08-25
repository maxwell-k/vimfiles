" ftplugin/black.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use as set filetype=python.black
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['black']
" For Black compatiblity based upon https://github.com/psf/black/issues/429
let s:options = '--ignore='
let s:options .= ',E101,E111,E114,E115,E116,E117,E121,E122,E123,E124,E125'
let s:options .= ',E126,E127,E128,E129,E131,E133,E2,E3,E5,E701,E702,E703'
let s:options .= ',E704,W1,W2,W3,W503,W504'
let b:ale_python_flake8_options = s:options
