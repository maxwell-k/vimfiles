" ale_linters/wat/wat2wasm.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" ALE Linter for Web Assembly Text

function! ale_linters#wat#wat2wasm#Handle(buffer, lines) abort
    " len('<stdin>:') = 8
    let l:output = []
    for l:line in a:lines
        let l:col_start = match(l:line, ':', 2) + 1
        let l:type_start = match(l:line, ':', l:col_start) + 1
        let l:text_start = match(l:line, ':', l:type_start) + 2
        if l:line[l:type_start : l:text_start - 3] ==# ' error'
          call add(l:output, {
          \   'lnum': l:line[2 : l:col_start - 2] + 0,
          \   'col': l:line[l:col_start : l:type_start - 2] + 0,
          \   'type': 'E',
          \   'text': l:line[l:text_start : -1]
          \})
        endif
    endfor
    return l:output
endfunction


call ale#linter#Define('wat', {
\   'name': 'wat2wasm',
\   'callback': 'ale_linters#wat#wat2wasm#Handle',
\   'output_stream': 'stderr',
\   'executable': 'wat2wasm',
\   'command': 'wat2wasm - --output=-',
\})
