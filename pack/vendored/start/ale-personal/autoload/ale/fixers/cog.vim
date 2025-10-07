" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Process a file with cog
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/autoload/ale/fixers/cog.vim
"
function! ale#fixers#cog#Fix(buffer) abort
  return { 'command':  'cog -' }
endfunction
