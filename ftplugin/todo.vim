" ftplugin/todo.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
if &filetype==#'todo'
  let g:Todo_txt_prefix_creation_date=1
elseif exists('g:Todo_txt_prefix_creation_date')
    unlet g:Todo_txt_prefix_creation_date
endif

if &filetype==#'markdown'
  let g:TodoTxtForceDoneName='../done.txt'
else
  let g:TodoTxtForceDoneName='done.txt'
endif

let g:Todo_txt_do_not_map=1
packadd todo.txt
runtime OPT ftplugin/todo.vim
setlocal nowrap
setlocal omnifunc=todo#Complete
setlocal isfname-=+
setlocal path+=./Projects
setlocal suffixesadd+=.md

nnoremap <script> <silent> <buffer>
  \ <localleader>tD :call todo#RemoveCompleted()<CR>
nmap <silent> <buffer> <localleader>td <Plug>DoToggleMarkAsDone
