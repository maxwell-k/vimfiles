" ALE Linter for ReStructuredText (rst)

function! ale_linters#rst#rst2pseudoxml#Handle(buffer, lines) abort
    " len('<stdin>:') = 8
    let l:output = []
    for l:line in a:lines
        call add(l:output, {
        \   'filename': expand('#1'),
        \   'lnum': l:line[8 : match(l:line, ':', 8) - 1],
        \   'type': l:line[match(l:line, ' (') + 2],
        \   'text': l:line[match(l:line, ') ') + 2:],
        \})
    endfor
    return l:output
endfunction


call ale#linter#Define('rst', {
\   'name': 'rst2pseudoxml',
\   'executable': 'rst2pseudoxml',
\   'command': 'rst2pseudoxml',
\   'callback': 'ale_linters#rst#rst2pseudoxml#Handle',
\   'output_stream': 'stderr',
\})
