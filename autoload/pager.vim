" autoload/pager.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! pager#pager() abort
  " Tested with and for example for use with:
  " $ PAGER='vim -c "call pager#pager()" -' ansible-doc file
  " $ PAGER='vim -c "call pager#pager()" -' python -m pydoc str
  " With /usr/local/bin/pager as:
  "   #!/bin/sh
  "   vim -c "call pager#pager()" -
  " $ PAGER=/usr/local/bin/pager gsutil ls --help
  setlocal nolist buftype=nofile colorcolumn=
  call maktaba#plugin#Detect()
  silent call maktaba#buffer#Substitute('.\b','')
  silent call maktaba#buffer#Substitute('[[:escape:]]\[[^@-~]*[@-~]','')
  silent call maktaba#buffer#Substitute('[[:cntrl:]]','')
endfunction
