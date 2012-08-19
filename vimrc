set guioptions+=c  " keyboard workaround for file changed dialog
set guioptions-=m  " only works if a single option per line
set guioptions-=T
call pathogen#infect()
colorscheme solarized
set t_Co=16
set background=dark
set expandtab
set shiftwidth=4
set tabstop=4
set linebreak
set kp= " use `K` for `:help`
" launch google-chrome on the URL under the cursor with control enter
noremap <C-CR> :silent !google-chrome "<cfile>" &<CR>
" shell scripts {{{1
au BufEnter /tmp/bash-fc* set ft=sh      "highlighting for fc
au FileType sh set noexpandtab
au FileType sh let g:is_posix = 1
au FileType sh let g:sh_fold_enabled= 3
" vim: set foldmethod=marker :{{{1
