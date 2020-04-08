" autoload/vba.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! vba#foldtext() abort
    let result =  getline(v:foldstart)
    let result .= ' [' . v:foldlevel .': '
    let result .= (v:foldend - v:foldstart) . ' lines]'
    return result
endfunction
