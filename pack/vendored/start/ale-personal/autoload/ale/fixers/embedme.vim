" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Run embedme over the file
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/autoload/ale/fixers/embedme.vim
"
function! ale#fixers#embedme#Fix(buffer) abort
  let s:npx = 'npm exec --prefer-offline -- '
  return {'command': s:npx . 'embedme --silent --source-root %s:h --stdout %t'}
endfunction
