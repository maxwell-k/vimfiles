" Author: John Nduli https://github.com/jnduli
" Description: Rstcheck for reStructuredText files
" Copyright (c) 2016-2019, w0rp <devw0rp@gmail.com>
" SPDX-License-Identifier: BSD-2-Clause
" Author: Keith Maxwell
" Modification: Added `--report warning` as a separate linter because the
" original doesn't support passing options
" Copyright 2020 Keith Maxwell

function! ale_linters#rst#rstcheckwarn#Handle(buffer, lines) abort
    " matches: 'bad_rst.rst:1: (SEVERE/4) Title overline & underline
    " mismatch.'
    let l:pattern = '\v^(.+):(\d*): \(([a-zA-Z]*)/\d*\) (.+)$'
    let l:dir = expand('#' . a:buffer . ':p:h')
    let l:output = []
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'filename': ale#path#GetAbsPath(l:dir, l:match[1]),
        \   'lnum': l:match[2] + 0,
        \   'col': 0,
        \   'type': l:match[3] is# 'SEVERE' ? 'E' : 'W',
        \   'text': l:match[4],
        \})
    endfor

    return l:output
endfunction

function! ale_linters#rst#rstcheckwarn#GetCommand(buffer) abort
    return ale#path#BufferCdString(a:buffer)
    \   . 'rstcheck --report warning'
    \   . ' %t'
endfunction


call ale#linter#Define('rst', {
\   'name': 'rstcheckwarn',
\   'executable': 'rstcheck',
\   'command': function('ale_linters#rst#rstcheckwarn#GetCommand'),
\   'callback': 'ale_linters#rst#rstcheckwarn#Handle',
\   'output_stream': 'both',
\})
