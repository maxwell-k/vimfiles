function! DBextPostResult(db_type, buf_nr)
  sleep 1
  buffer Result
  call maktaba#buffer#Substitute('\d\d:\d\d$', 'XX:XX','e', 1, 1)
  call maktaba#buffer#Substitute(' \+$', '')
  call maktaba#buffer#Substitute('D([^)]*)', 'D(XXXXX)', 'e', 1, 1)
  let l:regex = '^job started:\d\d:\d\d:\d\d'
  if getline(2) =~# l:regex
    call maktaba#buffer#Substitute(l:regex, 'job started:XX:XX:XX', 'e', 2, 2)
  endif
endfunction
