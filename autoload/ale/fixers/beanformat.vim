" autoload/ale/fixers/beanformat.vim
" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Formatting files with bean-format, part of beeancount
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#fixers#beanformat#Fix(buffer) abort
  let l:executable = ale#handlers#beanformat#GetExecutable(a:buffer)
  let l:options = ale#Var(a:buffer, 'beancount_beanformat_options')

  return { 'command': ale#Escape(l:executable) . ale#Pad(l:options) . ' -' }
endfunction
