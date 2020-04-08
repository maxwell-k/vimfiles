" ftplugin/sh.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal foldtext=getline(v:foldstart)
setlocal expandtab& shiftwidth& softtabstop&
let g:sh_fold_enabled= 3
