" For example:
"     $ echo '"' | js-yaml
"     YAMLException: unexpected end of the stream within a double quoted
"     \ scalar at line 2, column 1:
"         ^

function! ale_linters#yaml#jsyaml#Handle(buffer, lines) abort
    let l:output = []
    " See https://github.com/nodeca/js-yaml/ - lib/js-yaml/mark.js and
    " lib/js-yaml/exception.js
    let l:pattern =
    \   'YAMLException: \(.*\) at line \(\d\+\), column \(-\=\d\+\):$'
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
\   'executable': 'js-yaml',
\   'command': 'js-yaml',
\   'callback': 'ale_linters#yaml#jsyaml#Handle',
\   'output_stream': 'stderr',
\})
