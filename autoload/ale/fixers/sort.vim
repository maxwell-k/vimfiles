" autoload/ale/fixers/sort.vim
" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Process a file with cog
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#sort#Fix(buffer) abort
  if search('^#') == 0
    let l:command = ale#Env('LC_ALL', 'C') . 'sort --unique'
  else
    let l:command = 'cat'
  end
  return { 'command': l:command }
endfunction
