function! sed#GetCommand(buffer) abort
    return ale#path#BufferCdString(a:buffer)
    \   . 'sed -n -e "/.\{80\}/=" '
    \   . ' %t'
endfunction

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
