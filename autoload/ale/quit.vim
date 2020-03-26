" autoload/ale/quit.vim
" Description: Quit ALE after running a fixer
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! ale#quit#Mapping() abort
  " For use with:
  " noremap <Leader>a :call ale#quit#Mapping()<CR>
  augroup ale_quit
  autocmd User ALEFixPost wq
  augroup END
  ALEFix
endfunction
