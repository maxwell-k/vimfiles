" ftplugin/sh.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" https://google.github.io/styleguide/shellguide.html#s5.1-indentation
setlocal expandtab
setlocal shiftwidth=2

setlocal foldtext=getline(v:foldstart)
let g:sh_fold_enabled= 3
