" autoload/mkdHtml.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! mkdHtml#Handle(buffer, lines) abort
    let l:output = []
    for l:number in a:lines
        call add(l:output, {
        \   'lnum': l:number,
        \   'col': 4,
        \   'type': 'E',
        \   'text': 'HTML fenced code block included',
        \})
    endfor

    return l:output
endfunction
