nnoremap <silent> <Plug>(interpreted_text) :call <SID>interpreted_text()<CR>
function! s:interpreted_text() abort "{{{
  " requires the repeat package
  normal! ciW``
  undojoin | normal! P
  silent! call repeat#set("\<Plug>(interpreted_text)")
endfunction "}}}
