" autoload/backlog.vim
" Copyright Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! backlog#Sort(type) abort
    let l:marker = '{{{'
    let l:oldcursor=todo#GetCurpos()
    let l:lines = getline(0, line('$'))
    let l:count = count(l:lines, l:marker)
    if l:count == 0
      let l:index = 0
    elseif l:count >= 1
      let l:index = len(l:lines) - index(reverse(l:lines), l:marker) - 1
    endif
    " +1 because list indices start at 0 and line numbers start at 1
    execute ':' . (l:index + 1) . ',$sort /.\{-}\ze' . a:type . '/'
    call setpos('.', l:oldcursor)
endfunction
