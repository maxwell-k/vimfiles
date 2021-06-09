" autoload/sed.vim
" Copyright 2020, 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! sed#Handle(buffer, lines) abort
    let l:output = []
    for l:number in a:lines
        call add(l:output, {
        \   'lnum': l:number,
        \   'col': 80,
        \   'type': 'W',
        \   'text': 'Line too long',
        \})
    endfor

    return l:output
endfunction
