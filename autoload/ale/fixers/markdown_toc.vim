" autoload/ale/fixers/markdown_toc.vim
" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Add a table of contents with markdown-toc
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#markdown_toc#Fix(buffer) abort
  " Use --bullets=- to be compatible with prettier, see also
  " https://github.com/jonschlinkert/markdown-toc/issues/146
  let s:npx = 'npm exec --prefer-offline -- '
  return {
    \ 'command': s:npx . 'markdown-toc --bullets=- -i %t',
    \ 'read_temporary_file': 1,
  \ }
endfunction
