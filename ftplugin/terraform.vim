" ftplugin/terraform.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd terraform
setlocal commentstring=#%s
let b:ale_fixers = ['terraform',]
