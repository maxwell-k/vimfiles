scriptencoding utf-8
" ftplugin/todo.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" https://github.com/todotxt/todo.txt
if &filetype==#'todo'
  let g:Todo_txt_prefix_creation_date=1
  setlocal cursorline
  setlocal nowrap
elseif exists('g:Todo_txt_prefix_creation_date')
  unlet g:Todo_txt_prefix_creation_date
endif
if !exists('g:Todo_fold_char')
  let g:Todo_fold_char = '+'
endif

let g:Todo_txt_do_not_map=1
packadd todo.txt
runtime OPT ftplugin/todo.vim

setlocal colorcolumn=
setlocal foldtext=vim#todo_foldtext()
setlocal isfname-=+
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
nnoremap <script> <buffer> <localleader>tD :call vim#RemoveCompleted()<CR>
nnoremap <script> <buffer> <localleader>tf :call toggle#todo_fold()<CR>
nnoremap <script> <silent> <buffer> <localleader>t+ :call todo#Sort("+")<CR>
nnoremap <script> <silent> <buffer> <localleader>t<BS> :call vim#cancel()<CR>
nnoremap <script> <silent> <buffer> <localleader>t@ :call todo#Sort("@")<CR>
nnoremap <script> <silent> <buffer> <localleader>tp :call todo#Sort("")<CR>
nnoremap <script> <silent> <buffer> <localleader>tu :call todo#SortDue()<CR>
nnoremap <silent> <buffer> <localleader>t<Space> <Plug>DoToggleMarkAsDone<CR>

let s:prefix = 'nnoremap <script> <silent> <buffer> <localleader>t'
execute s:prefix.'<CR>'
  \ .' :silent .w !pipx run urlscan --no-browser'
  \ .' \| xargs --max-args=1 xdg-open 1>/dev/null 2>/dev/null'
  \ .'<CR>'

let b:ale_fixers = ['trim_whitespace']
