" vint: -ProhibitAutocmdWithNoGroup
au BufRead,BufNewFile **/configuration/**/*.py set filetype=python.black
au BufRead,BufNewFile $HOME/**/*.py set filetype=python.black
au BufRead,BufNewFile $HOME/**/* if &filetype ==? 'python'
  \| set filetype=python.black | endif
au BufRead,BufNewFile /media/removable/**/* if &filetype ==? 'python'
  \| set filetype=python.black | endif
