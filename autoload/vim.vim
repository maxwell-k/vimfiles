" autoload/vim.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
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
function! vim#new() abort "{{{1
 silent! 5new +setlocal\ buftype=nofile\ bufhidden=hide\ noswapfile<CR>
endfunction "}}}1
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
function! vim#RemoveCompletedWrapped() abort "{{{1
  "Call todo#RemoveComplete with a specific file set for done
  let l:forced = 0
  if stridx(&filetype, 'markdown') >= 0
    let g:TodoTxtForceDoneName = '../done.txt'
    let l:forced = 1
  endif
  if expand('%') =~# 'someday-maybe.txt$\|in-basket.txt$'
    let g:TodoTxtForceDoneName = 'done.txt'
    let l:forced = 1
  endif
  call todo#RemoveCompleted()
  if l:forced
    unlet g:TodoTxtForceDoneName
  endif
endfunction
function! vim#Cancel() abort "{{{1
  let l:out = getline('.').' ~~'
  let l:out = substitute(l:out, '\d\d\d\d-[01]\d-[0-3]\d ', '\0\~\~', '')
  call setline('.', l:out)
  if l:out[0] !=# 'x'
    call todo#MarkAsDone('')
  endif
endfunction
" vim: set foldmethod=marker foldlevel=0 :
