" pack/vendored/start/backlog/autoload/backlog.vim
" Copyright Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let s:marker = '{{{'

function! backlog#Sort(type = '+') abort
  let l:oldcursor = getcurpos()
  let l:lines = getline(0, '$')
  let l:count = count(l:lines, s:marker)
  if l:count == 0
    let l:index = 0
  elseif l:count >= 1
    let l:index = len(l:lines) - index(reverse(l:lines), s:marker) - 1
  endif
  " +1 because list indices start at 0 and line numbers start at 1
  execute ':' . (l:index + 1) . ',$sort /.\{-}\ze' . a:type . '/'
  call setpos('.', l:oldcursor)
endfunction

function! backlog#Later() abort
  let l:starting_foldenable = &foldenable
  let l:starting_position = getcurpos()
  set nofoldenable
  move $
  call backlog#Sort()
  call setpos('.', l:starting_position)
  let &foldenable = l:starting_foldenable
endfunction

function! backlog#Immediately() abort
  let l:starting_position = getcurpos()
  if count(getline(0, '$'), s:marker) == 0
    normal! ggO{{{
    let l:starting_position[1] += 1
    call setpos('.', l:starting_position)
  endif
  move 0
  call setpos('.', l:starting_position)
endfunction
