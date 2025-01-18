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
    elseif l:count == 1
      let l:index = index(l:lines, l:marker)
    else
      echo 'Error: too may fold markers '.l:marker
      return
    endif
    " +1 because lines list indices start at 0 and lines start at 1
    execute ':' . (l:index + 1) . ',$sort /.\{-}\ze' . a:type . '/'
    call setpos('.', l:oldcursor)
endfunction
