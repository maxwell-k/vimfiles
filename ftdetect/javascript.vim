augroup filetypedetect " to match filetype.vim
" src/ means likely part of a react app
" pack/ansible/opt/jsx/ftdetect/javascript.vim is complicated
autocmd BufRead,BufNewFile *src/*.js set filetype=javascript.jsx
