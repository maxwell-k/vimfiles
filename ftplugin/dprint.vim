" ftplugin/dprint.vim
" Copyright 2023 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let b:ale_fixers = filter(b:ale_fixers, 'v:val !=# "prettier"') +  ['dprint']
