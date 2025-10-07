" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/ale_linters/toml/tomlv_py.vim
"
call ale#linter#Define('toml', {
\   'name': 'tomlv_py',
\   'executable': 'tomlv.py',
\   'command': '%e',
\   'callback': {buffer, lines -> ale#util#FuzzyJSONDecode(lines, [])}
\})
