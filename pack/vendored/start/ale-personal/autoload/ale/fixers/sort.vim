" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Sort a file that contains no comments
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/autoload/ale/fixers/sort.vim
"
function! ale#fixers#sort#Fix(buffer) abort
  if search('^#', 'n') == 0
    let l:command = ale#Env('LC_ALL', 'C') . 'sort --unique'
  else
    let l:command = 'cat'
  end
  return { 'command': l:command }
endfunction
