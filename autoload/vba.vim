function! vba#foldtext() abort
    let result =  getline(v:foldstart)
    let result .= ' [' . v:foldlevel .': '
    let result .= (v:foldend - v:foldstart) . ' lines]'
    return result
endfunction
