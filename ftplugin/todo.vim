" ftplugin/todo.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" https://github.com/todotxt/todo.txt
if &filetype==#'todo'
  let g:Todo_txt_prefix_creation_date=1
  setlocal cursorline
elseif exists('g:Todo_txt_prefix_creation_date')
  unlet g:Todo_txt_prefix_creation_date
endif

let g:Todo_txt_do_not_map=1
packadd todo.txt
runtime OPT ftplugin/todo.vim
setlocal nowrap
setlocal omnifunc=todo#Complete
setlocal isfname-=+
setlocal path+=./Projects
setlocal suffixesadd+=.md
setlocal colorcolumn=

" ~/.vim/pack/submodules/opt/todo.txt/ftplugin/todo.vim
let s:prefix = 'nnoremap <script> <silent> <buffer> <localleader>t'
":sort i
execute s:prefix . '@ :call todo#Sort("@")<CR>'
execute s:prefix . '+ :call todo#Sort("+")<CR>'
execute s:prefix . 'a :call todo#PrioritizeAdd("A")<CR>'
execute s:prefix . 'b :call todo#PrioritizeAdd("B")<CR>'
execute s:prefix . 'c :call todo#PrioritizeAdd("C")<CR>'
execute s:prefix . 'd :call todo#ToggleMarkAsDone("")<CR>'
execute s:prefix . 'D :call vim#RemoveCompletedWrapped()<CR>'
execute s:prefix . 'p :call todo#Sort("")<CR>'
execute s:prefix . 'u :call todo#SortDue()<CR>'
