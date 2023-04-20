" autoload/test/strategy.vim
" Copyright 2023 Keith Maxwell, original copyright Janko Marohnić
" SPDX-License-Identifier: Vim
"
" Based upon the function of the same name from the file below with a call to
" date added:
" https://github.com/vim-test/vim-test/blob/master/autoload/test/strategy.vim
"
scriptencoding utf-8
function! test#strategy#shtuff(cmd) abort
  if !exists('g:shtuff_receiver')
    echoerr 'You must define g:shtuff_receiver to use this strategy'
    return
  endif

  call system('shtuff into '.shellescape(g:shtuff_receiver)
    \ .' '. shellescape('date && '.a:cmd))
endfunction
