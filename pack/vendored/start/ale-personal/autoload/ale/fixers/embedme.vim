" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Run embedme over the file
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/autoload/ale/fixers/embedme.vim
"
function! ale#fixers#embedme#Fix(buffer) abort
  return {'command': 'embedme --silent --source-root %s:h --stdout %t'}
endfunction
