" vint: -ProhibitAutocmdWithNoGroup
autocmd BufRead,BufNewFile **/configuration/**/*.py set filetype=python.black
autocmd BufRead,BufNewFile $HOME/**/*.py set filetype=python.black
autocmd BufRead,BufNewFile $HOME/**/* if &filetype ==? 'python'
  \| set filetype=python.black | endif
autocmd BufRead,BufNewFile /media/removable/**/* if &filetype ==? 'python'
  \| set filetype=python.black | endif
