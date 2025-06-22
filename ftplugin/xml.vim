" ftplugin/xml.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let g:xml_syntax_folding=1
setlocal nowrap
setlocal foldmethod=syntax
setlocal suffixesadd+=.py
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
