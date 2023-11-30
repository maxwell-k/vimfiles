" ftplugin/json.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal formatprg=jq\ .
let b:ale_fixers = ['jq']
