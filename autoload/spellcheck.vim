" autoload/spellcheck.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! spellcheck#StatusCode() abort "{{{1
  " zero if zero spelling mistakes found, one otherwise

  set spell

  " start at line 1 column 1
  call setcharpos('.', [0, 1, 1, 0])
  call maktaba#ensure#IsEqual(getcharpos('.'), [0, 1, 1, 0])

  " if there is a spelling mistake at the cursor
  if !maktaba#value#IsEqual(spellbadword(), ['', ''])
    return 1
  endif

  " try and move to the next spelling mistake
  normal! ]s

  " if the cursor has moved
  if !maktaba#value#IsEqual(getcharpos('.'), [0, 1, 1, 0])
    return 1
  endif

  return 0
endfunction

function! spellcheck#Exit() abort "{{{1
  " WARNING: discards any changes that haven't been written to disk!
  execute 'cquit ' . spellcheck#StatusCode()
endfunction
