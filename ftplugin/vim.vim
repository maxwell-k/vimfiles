" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" ftplugin/vim.vim
"
call ale#linter#Define('vim', {
\   'name': 'sed',
\   'executable': 'sed',
\   'cwd': '%s:h',
\   'command': '%e -n -e "/.\{80\}/=" %t',
\   'callback': {_, lines -> map(lines,
\     {_, lnum -> {
\       'lnum': lnum, 'col': 80, 'type': 'W', 'text': 'Line too long'}})},
\   'output_stream': 'stdout',
\})
