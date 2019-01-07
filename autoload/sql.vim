function! sql#foldtext() abort "{{{
    let result =  getline(v:foldstart)
    let result .= ' ['
    let result .= (v:foldend - v:foldstart) . ' lines]'
    return result
endfunction "}}}
