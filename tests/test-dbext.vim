" Run with: runVimTests.sh --user test-dbext.vim
set filetype=sql
DBExecSQL SELECT 1
buffer Result
echom 'dbext: results window has list option set'
set list?
qall
