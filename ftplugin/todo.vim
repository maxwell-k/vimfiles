scriptencoding utf-8
" ftplugin/todo.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" https://github.com/todotxt/todo.txt
if !exists('g:Todo_fold_char')
  let g:Todo_fold_char = ''
endif

":sort
let b:ale_fixers = ['trim_whitespace']
let g:Todo_txt_do_not_map=1
let g:Todo_txt_prefix_creation_date=1
let g:Todo_update_fold_on_sort = 1

":sort
setlocal colorcolumn=
setlocal cursorline
setlocal fillchars+=fold:\ ,
setlocal foldtext=vim#todo_foldtext()
setlocal isfname-=+
setlocal nowrap
setlocal omnifunc=todo#Complete
setlocal path+=./Projects
setlocal shiftwidth=4
setlocal spell
setlocal suffixesadd+=.md

for s:i in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  let s:cmd = 'noremap <script> <silent> <buffer>'
  let s:cmd .= ' <Plug>Priority� :call todo#PrioritizeAdd("�")<CR>'
  let s:cmd .= ' :silent! call repeat#set("\<Plug>Priority�")<CR>'
  execute substitute(s:cmd, '�', s:i, 'g')
  let s:cmd = 'nmap <silent> <buffer> <localleader>t� <Plug>Priority�'
  execute substitute(s:cmd, '�', s:i, 'g')
endfor

":sort
nnoremap <script> <buffer> <localleader>tp :call todo#Sort("+")<CR>
nnoremap <script> <buffer> <localleader>t<BS> :call vim#cancel()<CR>
nnoremap <script> <buffer> <localleader>t@ :call todo#Sort("@")<CR>
nnoremap <script> <buffer> <localleader>td :call vim#RemoveCompleted()<CR>
nnoremap <script> <buffer> <localleader>tf :call toggle#todo_fold()<CR>
nnoremap <script> <buffer> <localleader>ta :call todo#Sort("")<CR>
nnoremap <script> <buffer> <localleader>tu :call todo#SortDue()<CR>
nnoremap <silent> <buffer> <localleader>tt :call todo#ToggleMarkAsDone('')<CR>
