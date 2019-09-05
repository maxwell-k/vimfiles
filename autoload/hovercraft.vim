function! hovercraft#foldexpr( lnum ) abort
  let l:transition = '^----$'
  let l:modeline = '^.. vim:'
  if getline(a:lnum)=~l:transition
    return '>1'
  elseif getline(a:lnum+1)=~l:modeline
    return '0'
  else
    return '='
  endif
endfunction
