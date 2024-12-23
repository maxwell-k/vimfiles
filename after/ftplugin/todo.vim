scriptencoding utf-8
" after/ftplugin/todo.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" https://github.com/todotxt/todo.txt
if !exists('g:Todo_fold_char')
  let g:Todo_fold_char = ''
endif

":sort
let b:ale_fixers = ['trim_whitespace']
let g:Todo_update_fold_on_sort = 1

":sort
setlocal colorcolumn=
setlocal cursorline
setlocal isfname-=+
setlocal nowrap
setlocal omnifunc=todo#Complete
setlocal path+=./Projects
setlocal shiftwidth=4
setlocal spell
setlocal suffixesadd+=.md

for s:i in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  let s:cmd = 'noremap <script> <silent> <buffer>'
  let s:cmd .= ' <Plug>Priority� :call vim#SetTodoPriority("�")<CR>'
  let s:cmd .= ' :silent! call repeat#set("\<Plug>Priority�")<CR>'
  execute substitute(s:cmd, '�', s:i, 'g')
  let s:cmd = 'nmap <silent> <buffer> <localleader>t� <Plug>Priority�'
  execute substitute(s:cmd, '�', s:i, 'g')
endfor

" \td and \tt are duplicates
":sort
nnoremap <script> <buffer> <localleader>t<BS> :call vim#Cancel()<CR>
nnoremap <script> <buffer> <localleader>t@ :echo 'Context sort disabled.'<CR>
nnoremap <script> <buffer> <localleader>ta :call todo#Sort("")<CR>
nnoremap <script> <buffer> <localleader>tp :call todo#Sort("+")<CR>
nnoremap <script> <buffer> <localleader>td :call vim#RemoveCompleted()<CR>
nnoremap <script> <buffer> <localleader>tt :call todo#ToggleMarkAsDone('')<CR>
nnoremap <script> <buffer> <localleader>tu :call todo#SortDue()<CR>
nnoremap <script> <buffer> <localleader>to o<C-R>=strftime("%Y-%m-%d")<CR>
nnoremap <script> <buffer> <localleader>tO O<C-R>=strftime("%Y-%m-%d")<CR>

if expand('%:p') =~# '/todo.txt$'
  call vim#ConfigureSimpleFolding()
elseif expand('%:p') =~# '/routine.txt$'
  call vim#ConfigureSimpleFolding()
else
  setlocal fillchars+=fold:\ ,
  setlocal foldtext=vim#TodoFoldtext()
  nnoremap <script> <buffer> <localleader>tf :call toggle#TodoFold()<CR>
endif

iabbrev pm\ prioritisation:must
iabbrev ps\ prioritisation:should
iabbrev pc\ prioritisation:could
iabbrev pw\ prioritisation:will-not

iabbrev wt\ when:tomorrow
iabbrev ws\ when:soon
iabbrev wl\ when:later
iabbrev wm\ when:someday-maybe
