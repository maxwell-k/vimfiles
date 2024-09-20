" autoload/vim.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
scriptencoding utf8
function! vim#RemoveCompleted() abort "{{{1
  "Call todo#RemoveCompleted with a specific file set for done
  let l:forced = 0
  if stridx(&filetype, 'markdown') >= 0
    let g:TodoTxtForceDoneName = '../done.txt'
    let l:forced = 1
  endif
  if expand('%') =~# 'someday-maybe.txt$\|in-basket.txt$\|backlog.txt$'
    let g:TodoTxtForceDoneName = 'done.txt'
    let l:forced = 1
  endif
  call todo#RemoveCompleted()
  if l:forced
    unlet g:TodoTxtForceDoneName
  endif
endfunction
function! vim#browser() abort "{{{1
  " relies upon https://gitlab.com/maxwell-k/linkscan
  if stridx(&filetype, 'markdown') == -1
    silent .w !pipx run urlscan --no-browser | xargs
      \ xdg-open 1>/dev/null 2>/dev/null
  else
    execute 'w !linkscan - '.line('.')
      \ .' | xargs xdg-open 1>/dev/null 2>/dev/null'
  endif
endfunction
function! vim#cancel() abort "{{{1
  let l:out = getline('.').' ~~'
  let l:out = substitute(l:out, '\d\d\d\d-[01]\d-[0-3]\d ', '\0\~\~', '')
  call setline('.', l:out)
  if l:out[0] !=# 'x'
    call todo#MarkAsDone('')
  endif
endfunction
function! vim#keep() abort "{{{1
  " keep only the selected lines, delete all of the others
  if line("'<") > 1
    silent 0,'<-1d
  endif
  if line("'>") < line('$')
    silent '>+1,$d
  endif
  normal! 0gg
endfunction "}}}1
function! vim#scriptnames() abort "{{{1
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
function! vim#spellfile() abort "{{{1
  " Sometimes add $PWD/.en.utf-8.add to spellfile

  " If editing over netrw, e.g. http: or scp:
  if exists('b:netrw_lastfile')
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
function! vim#sum() range abort "{{{1
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
function! vim#yank_path_with_tilde() range abort "{{{1
  call SendViaOSC52(substitute(expand('%:p'), getenv('HOME'), '~', ''))
endfunction "}}1
function! vim#ConfigureModelineCompletion(choices) abort "{{{1
  let b:modeline_choices = a:choices
  set completefunc=vim#ChooseModeline
endfunction "}}}1
function! vim#ChooseModeline(findstart, base) abort "{{{1
  if a:findstart | return 0 | else | return b:modeline_choices | endif
endfunction "}}}1
function! vim#todo_foldtext() abort "{{{1
    let l:context = matchstr(getline(v:foldstart), g:Todo_fold_char.'[^ ]\+')
    return '           '.l:context
endfunction "}}}1
" vim: set foldmethod=marker foldlevel=0 :
