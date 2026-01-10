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
function! test#QuitWithErrorIfLoclistEmpty(timeout) abort
  let l:i = 0
  while len(g:ale_buffer_info['1']['loclist']) == 0 && l:i < a:timeout
    sleep 200ms
    let l:i += 200
  endwhile
  execute printf('cquit %d', len(g:ale_buffer_info['1']['loclist']) == 0)
endfunction
