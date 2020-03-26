" autoload/sql.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! sql#foldtext() abort
    let result =  getline(v:foldstart)
    let result .= ' ['
    let result .= (v:foldend - v:foldstart) . ' lines]'
    return result
endfunction
