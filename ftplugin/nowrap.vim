" ftplugin/nowrap.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal nowrap
setlocal colorcolumn=0
let b:ale_linters = ['rstcheckwarn', 'rst2pseudoxml'] " no sed
