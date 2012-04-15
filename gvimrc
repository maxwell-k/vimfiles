set guioptions+=c  " keyboard workaround for file changed dialog 
set guioptions-=m  " only works if a single option per line
set guioptions-=T
call pathogen#infect()
let g:is_posix = 1
colorscheme solarized
set background=dark

