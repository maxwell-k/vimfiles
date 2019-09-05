augroup filetypedetect " to match filetype.vim
autocmd BufRead,BufNewFile **/configuration/**/*.py set filetype=python.black
autocmd BufRead,BufNewFile $HOME/**/*.py set filetype=python.black
function! s:setf() abort
    if &filetype ==? 'python'
        set filetype=python.black
    endif
endfunction
autocmd BufRead,BufNewFile $HOME/**/* call s:setf()
autocmd BufRead,BufNewFile /media/removable/**/* call s:setf()
