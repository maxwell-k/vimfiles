if g:runVimTests !=# 'user'
  call vimtest#BailOut(
    \ 'Must be run with: runVimTests.sh --user test-dbext.vim')
  quit
endif
set filetype=sql
DBExecSQL SELECT 1
buffer Result
echom 'dbext: results window has list option set'
set list?
qall
