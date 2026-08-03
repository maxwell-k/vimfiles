scriptencoding utf-8
" pack/vendored/opt/brackets/plugin/mappings.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" For more comprehensive implementations, see the CountSpaces example in :help
" g@ and https://github.com/tpope/vim-surround/blob/master/plugin/surround.vim

" Add ⌜ before and ⌟ after anything
function s:BracketAdd(type = '') abort
  if a:type ==# 'setup'
    let &operatorfunc = matchstr(expand('<sfile>'), '<SNR>\w\+$')
    return 'g@'
  endif
  let l:before = '⌜'
  let l:after = '⌟'
    " [bufnum, lnum, col, off]
  let [_, l:lnum1, l:column, _] = getpos("'[")
  let l:column -= 1 "before
  let l:original = getline(l:lnum1)
  let l:changed = strcharpart(l:original, 0, l:column) .. l:before ..
    \ strcharpart(l:original, l:column)
  call setline(l:lnum1, l:changed)
  let [_, l:lnum2, l:column, _] = getpos("']")
  let l:column += l:lnum1 == l:lnum2 ? 1 : 0 " a character was added :
  let l:original = getline(l:lnum2)
  let l:changed = strcharpart(l:original, 0, l:column) .. l:after ..
    \ strcharpart(l:original, l:column)
  call setline(l:lnum2, l:changed)
endfunction

nnoremap <expr> <Plug>BracketAdd <SID>BracketAdd('setup')
xnoremap <expr> <Plug>BracketAdd <SID>BracketAdd('setup')

if !exists('g:brackets_no_mappings') || ! g:brackets_no_mappings
  nnoremap <Leader>bb <Plug>BracketAdd
  xnoremap <Leader>bb <Plug>BracketAdd
endif
