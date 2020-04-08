" ale_linters/vim/sed.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call ale#linter#Define(fnamemodify(expand('<sfile>:p:h'), ':t'), {
\   'name': 'sed',
\   'executable': 'sed',
\   'command': function('sed#GetCommand'),
\   'callback': 'sed#Handle',
\   'output_stream': 'stdout',
\})
