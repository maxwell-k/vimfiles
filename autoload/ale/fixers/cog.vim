" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Process a file with cog
" autoload/ale/fixers/cog.vim
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#cog#Fix(buffer) abort
  return { 'command':  'cog -' }
endfunction
