function! hovercraft#foldexpr( lnum ) abort
  let l:transition = '^----$'
  let l:modeline = '^.. v'. 'im:' " split so no mistaken as mode line by vim
  if getline(a:lnum) =~# l:transition
    return '>1'
  elseif getline(a:lnum+1) =~# l:modeline
    return '0'
  else
    return '='
  endif
endfunction
