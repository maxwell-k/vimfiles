function! ale_linters#toml#tomlv_py#Handle(buffer, lines) abort
  return ale#util#FuzzyJSONDecode(a:lines, [])
endfunction

call ale#linter#Define('toml', {
\   'name': 'tomlv_py',
\   'executable': 'tomlv.py',
\   'command': '%e',
\   'callback': 'ale_linters#toml#tomlv_py#Handle',
\})

" ale_linters/toml/tomlv_py.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
