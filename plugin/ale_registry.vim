" plugin/ale_registry.vim
" SPDX-License-Identifier: MPL-2.0
" Copyright 2025 Keith Maxwell
let s:entries = {}
" autoload/ale/fixers/sort.vim
let s:entries['sort'] = {
\ 'function': 'ale#fixers#sort#Fix',
\ 'suggested_filetypes': ['gitignore', 'spellfile'],
\ 'description': 'Sort with `sort` from PATH and LC_ALL=C',
\ }
" autoload/ale/fixers/beanformat.vim
let s:entries['beanformat'] = {
\ 'function': 'ale#fixers#beanformat#Fix',
\ 'suggested_filetypes': ['beancount'],
\ 'description': 'Format with bean-format',
\ }
" autoload/ale/fixers/cog.vim
let s:entries['cog'] = {
\ 'function': 'ale#fixers#cog#Fix',
\ 'suggested_filetypes': ['cog'],
\ 'description': 'Process with cog',
\ }
" autoload/ale/fixers/embedme.vim
let s:entries['embedme'] = {
\ 'function': 'ale#fixers#embedme#Fix',
\ 'suggested_filetypes': ['embedme'],
\ 'description': 'Embed snippets with embedme',
\ }
" autoload/ale/fixers/markdown_toc.vim
let s:entries['markdown-toc'] = {
\ 'function': 'ale#fixers#markdown_toc#Fix',
\ 'suggested_filetypes': ['markdown'],
\ 'description': 'Add a table of contents with markdown-toc',
\ }
" autoload/ale/fixers/usort.vim
let s:entries['usort'] = {
\ 'function': 'ale#fixers#usort#Fix',
\ 'suggested_filetypes': ['python'],
\ 'description': 'Sort Python imports with usort via uv',
\ }
" let s:entries[''] = {
" \ 'function': '',
" \ 'suggested_filetypes': [''],
" \ 'description': '',
" \ }
for [s:key, s:entry] in items(s:entries)
  call ale#fix#registry#Add(
    \ s:key,
    \ s:entry['function'],
    \ s:entry['suggested_filetypes'],
    \ s:entry['description']
    \ )
endfor
