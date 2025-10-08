" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Process a file with usort via uv
" autoload/ale/fixers/usort.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#usort#Fix(buffer) abort
  return { 'command': 'usort format -' }
endfunction
