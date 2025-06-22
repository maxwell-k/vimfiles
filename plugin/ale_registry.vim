" plugin/ale_registry.vim
" SPDX-License-Identifier: MPL-2.0
" Copyright 2025 Keith Maxwell
let s:entries = {}
" autoload/ale/fixers/sort.vim
let s:entries['sort'] = {
\   'function': 'ale#fixers#sort#Fix',
\   'suggested_filetypes': ['gitignore'],
\   'description': 'Sort with `sort` from PATH and LC_ALL=C',
\ }
for [s:key, s:entry] in items(s:entries)
  call ale#fix#registry#Add(
    \ s:key,
    \ s:entry['function'],
    \ s:entry['suggested_filetypes'],
    \ s:entry['description']
    \ )
endfor
