" autoload/vim.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
scriptencoding utf8
function! vim#AleQuit() abort "{{{1
  " For use with:
  " noremap <Leader>a :call vim#AleQuit()<CR>
  augroup ale_quit
  autocmd User ALEFixPost wq
  augroup END
  ALEFix
endfunction
function! vim#Browser() abort "{{{1
  let l:cmd = ''
  let l:cmd .= 'silent '
  if stridx(&filetype, 'markdown') >= 0 || stridx(&filetype, 'todo') >= 0
    " Relies upon https://gitlab.com/maxwell-k/linkscan for markdown.
    let l:cmd .= 'w !linkscan - '.line('.')
  else
    let l:cmd .= '.w !urlscan --no-browser'
  endif
  let l:cmd .= " | tr '\\n' '\\0' "
  let l:cmd .= ' | xargs -0 '
  if executable('xdg-open') " Linux
    let l:cmd .= 'xdg-open'
  elseif executable('open') " MacOS
    let l:cmd .= 'open'
  else
    echom 'vim#Browser(): no suitable command found'
    return
  endif
  let l:cmd .=' 1>/dev/null 2>/dev/null'
  " For debugging add a line like `:echom l:cmd` below.
  execute l:cmd
endfunction
function! vim#Cancel() abort "{{{1
  let l:out = getline('.').' ~~'
  let l:out = substitute(l:out, '\d\d\d\d-[01]\d-[0-3]\d ', '\0\~\~', '')
  call setline('.', l:out)
  if l:out[0] !=# 'x'
    call todo#MarkAsDone('')
  endif
endfunction
function! vim#Cdup() abort "{{{1
  let l:output = system('git rev-parse --show-cdup')
  let l:path = substitute(l:output, '\n$', '', '')
  return len(l:path) ? l:path : '.'
endfunction
function! vim#ChooseModeline(findstart, base) abort "{{{1
  if a:findstart | return 0 | else | return b:modeline_choices | endif
endfunction "}}}1
function! vim#ConfigureModelineCompletion(choices) abort "{{{1
  let b:modeline_choices = a:choices
  set completefunc=vim#ChooseModeline
endfunction "}}}1
function! vim#Keep() abort "{{{1
  " keep only the selected lines, delete all of the others
  if line("'<") > 1
    silent 0,'<-1d
  endif
  if line("'>") < line('$')
    silent '>+1,$d
  endif
  normal! 0gg
endfunction "}}}1
function! vim#RemoveCompleted() abort "{{{1
  let l:dir = expand('%:p:h')
  if match(expand('%:p'), '/Computers/todo.txt$') > 0 " then the repsitory root
    let l:out = system('git -C '.l:dir.' rev-parse --show-toplevel')
    let l:dir = maktaba#string#StripTrailing(l:out)
  endif

  global/^x /call writefile([getline(line("."))], l:dir . '/done.txt', 'a')|d
endfunction
function! vim#SetTodoPriority(priority) abort "{{{1
  " The implementation in autoload/todo.vim in
  " https://gitlab.com/dbeniamine/todo.txt-vim only supports A-F, this
  " implementation supports A-Z
  let l:pattern =  '^([A-Z]) '
  let l:replacement = '('.a:priority.') '
  let l:line = line('.')
  if getline('.') !~# l:pattern
    let l:pattern = '^'
  endif
  call maktaba#buffer#Substitute(
    \l:pattern, l:replacement, '', l:line, l:line, 1)
endfunction
function! vim#Scriptnames() abort "{{{1
  "Open the output of :scriptnames for searching
  let l:file=tempname()
  let l:more_saved=&more
  set nomore
  execute 'redir > '.l:file
  silent scriptnames
  redir END
  let &more=l:more_saved
  execute 'new '.l:file
  normal! OOutput from ``:scriptnames``:
  setlocal buftype=nofile bufhidden=hide noswapfile
endfunction "}}}
function! vim#Spellfile() abort "{{{1
  " add $PWD/.en.utf-8.add to spellfile, outside netrw

  " If editing over netrw, e.g. http: or scp:
  if exists('b:netrw_curdir')
    return
  endif

  " Handle special characters in path
  if bufname('%') =~# '[' || bufname('%') =~# '@' || bufname('%') =~# ' '
    setlocal spellfile+=./.en.utf-8.add
    return
  endif

  let l:cmd = 'setlocal spellfile+='
  let l:cmd .= fnamemodify(resolve(expand('%')), ':h')
  let l:cmd .= '/.en.utf-8.add'
  execute l:cmd
endfunction "}}}1
function! vim#Sum() range abort "{{{1
"Assumes 'selection' is blockwise and inclusive
python3 <<EOS
import vim
import decimal
top, left       = vim.eval("getpos(\"'<\")[1:2]")
bottom, right   = vim.eval("getpos(\"'>\")[1:2]")
top, left, bottom, right = int(top), int(left), int(bottom), int(right)
numbers = [i[left - 1:right] for i in vim.current.buffer[top - 1:bottom]]
numbers = [i.replace(',','').rstrip('\xc2\xa3 ') for i in numbers]
result = '{:,}'.format(sum(decimal.Decimal(i) for i in numbers if i))
print(result)
EOS
let @= = "'".py3eval('result')."'"
endfunction "}}}1
function! vim#TodoFoldtext() abort "{{{1
    let l:context = matchstr(getline(v:foldstart), g:Todo_fold_char.'[^ ]\+')
    return '           '.l:context
endfunction "}}}1
function! vim#YankPathWithTilde() range abort "{{{1
  call SendViaOSC52(substitute(expand('%:p'), getenv('HOME'), '~', ''))
endfunction "}}1
" vim: set foldmethod=marker foldlevel=0 : {{{1
