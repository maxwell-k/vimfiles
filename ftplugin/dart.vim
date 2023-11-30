" ftplugin/dart.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd dart
let b:ale_fixers = ['dartfmt']
let b:ale_linters = ['language_server'] " dartanalyzer does the same analysis
