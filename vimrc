set guioptions+=c  " keyboard workaround for file changed dialog 
set guioptions-=m  " only works if a single option per line
set guioptions-=T
call pathogen#infect()
let g:is_posix = 1
colorscheme solarized
set t_Co=16
set background=dark
set shiftwidth=4
set expandtab
set tabstop=4
au BufEnter /tmp/bash-fc* set ft=sh "highlighting for fc
