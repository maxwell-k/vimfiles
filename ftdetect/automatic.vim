augroup filetypedetect " to match filetype.vim
" See `:help setfiletype`, `setfiletype text` is called on *.txt
autocmd! BufRead,BufNewFile */planning/*.txt setlocal filetype=rst.automatic
