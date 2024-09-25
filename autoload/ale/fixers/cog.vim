" autoload/ale/fixers/cog.vim
" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Process a file with cog
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#cog#Fix(buffer) abort
  let l:command = 'uv tool run --python=/usr/bin/python3.11'
  let l:command .= ' --from=cogapp cog -'
  return { 'command': l:command }
endfunction
