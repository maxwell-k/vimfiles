" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Quit ALE after running a fixer
function! ale#quit#Mapping() abort
  " For use with:
  " noremap <Leader>a :call ale#quit#Mapping()<CR>
  augroup ale_quit
  autocmd User ALEFixPost wq
  augroup END
  ALEFix
endfunction
