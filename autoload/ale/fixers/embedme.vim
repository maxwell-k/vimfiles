" autoload/ale/fixers/emdbedme.vim
" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Run embedme over the file
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#embedme#Fix(buffer) abort
  let s:npx = 'npm exec --prefer-offline -- '
  return {'command': s:npx . 'embedme --silent --source-root %s:h --stdout %t'}
endfunction
