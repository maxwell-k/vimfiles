" autoload/backlog.vim
" Copyright Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! backlog#Sort(type) abort
    let oldcursor=todo#GetCurpos()
    execute ':sort /.\{-}\ze'.a:type.'/'
    call setpos('.', oldcursor)
endfunction
