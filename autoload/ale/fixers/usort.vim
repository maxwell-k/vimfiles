" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Process a file with usort via uv
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" autoload/ale/fixers/usort.vim
"
function! ale#fixers#usort#Fix(buffer) abort
  return { 'executable': 'usort', 'command': '%e format -' }
endfunction
