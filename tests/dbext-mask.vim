function! DBextPostResult(db_type, buf_nr)
  sleep 1
  buffer Result
  call maktaba#buffer#Substitute('\d\d:\d\d$', 'XX:XX','e', 1, 1)
  call maktaba#buffer#Substitute(' \+$', '')
  call maktaba#buffer#Substitute('D([^)]*)', 'D(XXXXX)', 'e', 1, 1)
endfunction
