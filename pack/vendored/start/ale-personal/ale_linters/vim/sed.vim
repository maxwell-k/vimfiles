" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/ale_linters/vim/sed.vim
"
call ale#linter#Define(fnamemodify(expand('<sfile>:p:h'), ':t'), {
\   'name': 'sed',
\   'executable': 'sed',
\   'cwd': '%s:h',
\   'command': 'sed -n -e "/.\{80\}/=" %t',
\   'callback': {_, lines -> map(lines,
\     {_, lnum -> {
\       'lnum': lnum, 'col': 80, 'type': 'W', 'text': 'Line too long'}})},
\   'output_stream': 'stdout',
\})
