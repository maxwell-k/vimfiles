set guioptions+=c  " keyboard workaround for file changed dialog 
set guioptions-=m  " only works if a single option per line
set guioptions-=T
call pathogen#infect()
let g:is_posix = 1
let g:sh_fold_enabled= 3 
colorscheme solarized
set t_Co=16
set background=dark
set expandtab
" Don't expand tabs in shell scripts
au FileType sh set noexpandtab
set shiftwidth=4
set tabstop=4
set linebreak
au BufEnter /tmp/bash-fc* set ft=sh "highlighting for fc
