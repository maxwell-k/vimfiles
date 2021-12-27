" ale_linters/yaml/jsyaml.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use https://www.npmjs.com/package/js-yaml to get fast feedback.
" Invalid syntax is highlighted without writing the current file to disk.
" Rules are compatible with prettier.
"
" See also tests/automated/js-yaml/unit.vader
function! ale_linters#yaml#jsyaml#Handle(buffer, lines) abort
    let l:output = []
    " See https://github.com/nodeca/js-yaml/ - lib/js-yaml/mark.js and
    " lib/js-yaml/exception.js
    let l:pattern =
    \   'YAMLException: \(.*\) (\(\d\+\):\(-\=\d\+\))$'
    for l:match in ale#util#GetMatches(a:lines, l:pattern) " uses matchlist(
        call add(l:output, {
        \   'text': l:match[1],
        \   'lnum': str2nr(l:match[2]),
        \   'col': str2nr(l:match[3]),
        \})
    endfor
    return l:output
endfunction

call ale#linter#Define('yaml', {
\   'name': 'js-yaml',
\   'executable': 'npm',
\   'command': 'npm exec -- js-yaml',
\   'callback': 'ale_linters#yaml#jsyaml#Handle',
\   'output_stream': 'stderr',
\})
