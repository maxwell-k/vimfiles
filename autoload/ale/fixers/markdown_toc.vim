" autoload/ale/fixers/markdown_toc.vim
" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Add a table of contents with markdown-toc
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#markdown_toc#Fix(buffer) abort
  return {'command': 'markdown-toc -i %t', 'read_temporary_file': 1}
endfunction
