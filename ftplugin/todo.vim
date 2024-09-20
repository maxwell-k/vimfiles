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

" ~/.vim/pack/submodules/opt/todo.txt/ftplugin/todo.vim
let s:prefix_start = 'nnoremap <script> <silent> <buffer> '
let s:prefix = s:prefix_start.'<localleader>t'

":sort i
execute s:prefix . '@ :call todo#Sort("@")<CR>'
execute s:prefix . '+ :call todo#Sort("+")<CR>'
execute s:prefix . 'D :call vim#RemoveCompletedWrapped()<CR>'
execute s:prefix . 'p :call todo#Sort("")<CR>'
execute s:prefix . 'u :call todo#SortDue()<CR>'
execute s:prefix . 'f :call toggle#todo_fold()<CR>'

" Only prefix <Space>, <CR> and <BS> with \t if another filetype like markdown
if &filetype==#'todo'
  nmap <silent> <buffer> <Space> <Plug>DoToggleMarkAsDone
  let s:prefix = s:prefix_start
else
  nmap <silent> <buffer> <localleader>t<Space> <Plug>DoToggleMarkAsDone
endif

execute s:prefix.'<CR>'
  \ .' :silent .w !pipx run urlscan --no-browser'
  \ .' \| xargs --max-args=1 xdg-open 1>/dev/null 2>/dev/null'
  \ .'<CR>'
execute s:prefix.'<BS> :call vim#cancel()<CR>'

let b:ale_fixers = ['trim_whitespace']
