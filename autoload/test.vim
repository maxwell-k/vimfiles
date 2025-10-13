" autoload/test.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! test#AleFixBlocking() abort
  let g:ale_fixing = 1
  augroup AleFixBlocking
  autocmd!
  autocmd User ALEFixPost let g:ale_fixing = 0
  augroup END
  ALEFix
  while get(g:, 'ale_fixing', 0) | sleep 150m | endwhile
endfunction
