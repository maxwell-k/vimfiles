" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" pack/vendored/start/ale-personal/ale_linters/rst/rst2pseudoxml.vim
"
" ALE Linter for ReStructuredText (rst)
call ale#Set('rst_rst2pseudoxml_executable', 'rst2pseudoxml')

function! ale_linters#rst#rst2pseudoxml#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'rst_rst2pseudoxml_executable')
endfunction

function! ale_linters#rst#rst2pseudoxml#Handle(buffer, lines) abort
    " len('<stdin>:') = 8
    let l:output = []
    for l:line in a:lines
        if l:line !=# 'See "backrefs" attribute for IDs.'
          call add(l:output, {
          \   'lnum': l:line[8 : match(l:line, ':', 8) - 1],
          \   'type': l:line[match(l:line, ' (') + 2],
          \   'text': l:line[match(l:line, ') ') + 2:],
          \})
        endif
    endfor
    return l:output
endfunction


call ale#linter#Define('rst', {
\   'name': 'rst2pseudoxml',
\   'executable': function('ale_linters#rst#rst2pseudoxml#GetExecutable'),
\   'command': '%e',
\   'callback': 'ale_linters#rst#rst2pseudoxml#Handle',
\   'output_stream': 'stderr',
\})
