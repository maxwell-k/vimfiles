" ftplugin/todo.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd todo.txt
runtime OPT ftplugin/todo.vim
setlocal nowrap
setlocal autowriteall
let g:Todo_txt_do_not_map=1

noremap  <script> <silent> <buffer> <localleader>td :call todo#PrependDate()<CR>
nnoremap <script> <silent> <buffer> <localleader>tD :call todo#RemoveCompleted()<CR>
nmap              <silent> <buffer> <localleader>tx <Plug>DoToggleMarkAsDone
