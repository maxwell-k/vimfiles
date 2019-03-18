function! mkdHtml#GetCommand(buffer) abort
    return ale#path#BufferCdString(a:buffer)
    \   . "sed -n -e '/````*html/=' "
    \   . ' %t'
endfunction

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
