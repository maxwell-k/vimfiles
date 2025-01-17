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
      let l:start = 1
    elseif l:count == 1
      let l:start = index(l:lines, l:marker) + 1
    else
      echo 'Error: too may fold markers '.l:marker
      return
    endif
    execute ':' . l:start . ',$sort /.\{-}\ze' . a:type . '/'
    call setpos('.', l:oldcursor)
endfunction
