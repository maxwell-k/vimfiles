" ftplugin/dprint.vim
" Copyright 2023 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let b:ale_fixers += ['dprint']
call filter(b:ale_fixers, 'v:val !=# "prettier"')
call filter(b:ale_fixers, 'v:val !=# "jq"')
