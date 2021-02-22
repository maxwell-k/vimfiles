" ftplugin/todo.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let g:Todo_txt_prefix_creation_date=1
let g:Todo_txt_do_not_map=1
packadd todo.txt
runtime OPT ftplugin/todo.vim
setlocal nowrap
setlocal omnifunc=todo#Complete

nnoremap <script> <silent> <buffer>
  \ <localleader>tD :call todo#RemoveCompleted()<CR>
nmap <silent> <buffer> <localleader>td <Plug>DoToggleMarkAsDone
