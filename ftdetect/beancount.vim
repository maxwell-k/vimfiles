" pack/ansible/start/beancount/ftdetect/beancount.vim is complicated
augroup filetypedetect " to match filetype.vim
au BufNewFile,BufRead *.beancount setf beancount
