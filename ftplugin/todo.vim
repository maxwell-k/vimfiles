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

noremap <script> <silent> <buffer>
  \ <Plug>PriorityA :call todo#PrioritizeAdd("A")<CR>
  \ :silent! call repeat#set("\<Plug>PriorityA")<CR>
nmap <silent> <buffer> <localleader>tA <Plug>PriorityA

noremap <script> <silent> <buffer>
  \ <Plug>PriorityB :call todo#PrioritizeAdd("B")<CR>
  \ :silent! call repeat#set("\<Plug>PriorityB")<CR>
nmap <silent> <buffer> <localleader>tB <Plug>PriorityB

noremap <script> <silent> <buffer>
  \ <Plug>PriorityC :call todo#PrioritizeAdd("C")<CR>
  \ :silent! call repeat#set("\<Plug>PriorityC")<CR>
nmap <silent> <buffer> <localleader>tC <Plug>PriorityC

" ~/.vim/pack/submodules/opt/todo.txt/ftplugin/todo.vim
let s:prefix_start = 'nnoremap <script> <silent> <buffer> '
let s:prefix = s:prefix_start.'<localleader>t'

":sort i
execute s:prefix . '@ :call todo#Sort("@")<CR>'
execute s:prefix . '+ :call todo#Sort("+")<CR>'
execute s:prefix . 'D :call vim#RemoveCompletedWrapped()<CR>'
execute s:prefix . 'p :call todo#Sort("")<CR>'
execute s:prefix . 'u :call todo#SortDue()<CR>'

" Only prefix <Space>, <CR> and <BS> with \t if another filetype like markdown
if &filetype==#'todo'
  nmap <silent> <buffer> <Space> <Plug>DoToggleMarkAsDone
  let s:prefix = s:prefix_start
else
  nmap <silent> <buffer> <localleader>t<Space> <Plug>DoToggleMarkAsDone
endif

execute s:prefix.'<CR>'
  \ .' :silent .w !pipx run urlscan --no-browser'
  \ .' \| xargs xdg-open 1>/dev/null 2>/dev/null'
  \ .'<CR>'
execute s:prefix.'<BS> :call vim#Cancel()<CR>'
