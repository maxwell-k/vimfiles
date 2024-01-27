" ftplugin/dprint.vim
" Copyright 2023 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let s:expression =  '!index(["prettier", "jq"], v:val)'
let b:ale_fixers = filter(b:ale_fixers, s:expression) +  ['dprint']
