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
  let l:path = resolve(expand('%'))
  if ! maktaba#string#StartsWith(l:path, 'scp')
    execute 'setlocal spellfile+='
    \ . ( bufname('%') =~# '[' ? '.' : fnamemodify(l:path, ':h') )
    \ . '/.en.utf-8.add'
  endif
endfunction "}}}1
" vim: set foldmethod=marker foldlevel=0 :
