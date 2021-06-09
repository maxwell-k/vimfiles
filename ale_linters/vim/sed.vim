" ale_linters/vim/sed.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call ale#linter#Define(fnamemodify(expand('<sfile>:p:h'), ':t'), {
\   'name': 'sed',
\   'executable': 'sed',
\   'cwd': '%s:h',
\   'command': 'sed -n -e "/.\{80\}/=" %t',
\   'callback': 'sed#Handle',
\   'output_stream': 'stdout',
\})
