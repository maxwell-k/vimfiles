" autoload/ale/handlers/beanformat.vim
" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Functions for working with bean-format, part of beancount
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call ale#Set('beancount_beanformat_executable', 'bean-format')
call ale#Set('beancount_beanformat_options', '')

function! ale#handlers#beanformat#GetExecutable(buffer) abort
  return ale#Var(a:buffer, 'beancount_beanformat_executable')
endfunction
