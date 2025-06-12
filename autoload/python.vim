scriptencoding utf-8
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
endfunction
function! python#documentation() abort
  let l:head = 'py -m pydoc '
  let l:tail = input('Prefix → ')
  if len(l:tail) > 0
     let l:tail .= '.'
  endif
  let l:tail .= expand('<cword>')
  let l:name = input(l:head, l:tail)
  execute ':!'.l:head.l:name
endfunction
function! python#ExecutableOrUv(buffer, tool) abort
" Facilitate running a tool like ruff:
" 1. From a virtual environment or
" 2. via $PATH or
" 3. via `uv tool run`.

" See also:
" after/ale_linters/python/ruff.vim
" pack/submodules/start/ale/ale_linters/python/ruff.vim
" pack/submodules/start/ale/autoload/ale/python.vim

    let l:result = ale#python#FindExecutable(
    \ a:buffer,
    \ 'python_' . a:tool,
    \ [a:tool]
    \ )

    if l:result ==# a:tool && !executable(a:tool)
        let l:result = 'uv'
    endif

    return l:result
endfunction
