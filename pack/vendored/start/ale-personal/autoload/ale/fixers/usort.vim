" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Process a file with usort via uv
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/autoload/ale/fixers/usort.vim
"
" See also ftplugin/usort.vim
function! ale#fixers#usort#Fix(buffer) abort
  return { 'command': 'uv --offline tool run usort format -' }
endfunction
