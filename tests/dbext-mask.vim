function! DBextPostResult(db_type, buf_nr)
  sleep 1
  buffer Result
  call vim#dbext_mask()
endfunction
