" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Formatting files with bean-format, part of beancount
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/autoload/ale/fixers/beanformat.vim
"
call ale#Set('beancount_beanformat_executable', 'bean-format')
call ale#Set('beancount_beanformat_options', '')

function! ale#fixers#beanformat#Fix(buffer) abort
  let l:executable = ale#Var(a:buffer, 'beancount_beanformat_executable')
  let l:options = ale#Var(a:buffer, 'beancount_beanformat_options')

  return { 'command': ale#Escape(l:executable) . ale#Pad(l:options) . ' -' }
endfunction
