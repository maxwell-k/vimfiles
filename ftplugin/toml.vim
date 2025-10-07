" ftplugin/toml.vim
" Copyright 2023 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal nowrap

call ale#linter#Define('toml', {
\   'name': 'tomlv_py',
\   'executable': 'tomlv.py',
\   'command': '%e',
\   'callback': {buffer, lines -> ale#util#FuzzyJSONDecode(lines, [])}
\})
