scriptencoding utf-8
" This implementation cannot tag anything that spans multiple lines.
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
  let [_, l:lnum, l:col1, _] = getpos("'[")
  let [_, _, l:col2, _] = getpos("']")
  let l:original = getline(l:lnum)
  let l:changed =
    \ strpart(l:original, 0, l:col1 - 1)
    \ ..
    \ l:before
    \ ..
    \ strpart(l:original, l:col1 - 1, l:col2 - l:col1 + 1)
    \ ..
    \ l:after
    \ ..
    \ strpart(l:original, l:col2)
  call setline(l:lnum, l:changed)
endfunction

nnoremap <expr> <Leader>bb <SID>BracketAdd('setup')
xnoremap <expr> <Leader>bb <SID>BracketAdd('setup')
