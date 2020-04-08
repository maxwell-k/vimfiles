" autoload/python.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! python#foldtext() abort
  "get first non-blank line
  let l:fs = v:foldstart
  while getline(l:fs) =~# '^\s*$'
    let l:fs = nextnonblank(l:fs + 1)
  endwhile
  if l:fs > v:foldend
    let l:line = getline(v:foldstart)
  else
    let l:line = substitute(getline(l:fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let l:size = 1 + v:foldend - v:foldstart
  let l:out = printf(' %d lines', l:size)
  let l:out .= printf('[%.1f%%]', (l:size*1.0)/line('$')*100)
  let l:out .= repeat('+--', v:foldlevel)
  let l:size = winwidth(0) - &foldcolumn - &number ? 8 : 0 - strwidth(l:out)
  let l:out = l:line . repeat('.', l:size) . l:out
  return l:out
endf
