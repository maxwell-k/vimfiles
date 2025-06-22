" ftplugin/python.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal commentstring=#\ %s
setlocal foldmethod=indent
setlocal foldtext=python#foldtext()
setlocal nowrap
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal suffixesadd+=.py
call toggle#PythonLinters('default')
noremap <Leader>pp :call toggle#PythonFiletype()<CR>
noremap <Leader>pl :call toggle#PythonLinters()<CR>
noremap <Leader>pt
  \ :exec 'new '. substitute(expand('%'), '.py$', '_test.py', '')<CR>
noremap <Leader>pT
  \ :exec 'above new '. substitute(expand('%'), '_test.py$', '.py', '')<CR>
noremap K :call python#documentation()<CR>

if &filetype =~# 'usort' " for example filetype=python.usort
  " See also autoload/ale/fixers/usort.vim
  execute ale#fix#registry#Add(
    \ 'usort',
    \ 'ale#fixers#usort#Fix',
    \ ['python'],
    \ 'sort Python imports with usort via uv'
    \ )
  let b:ale_fixers = get(b:, 'ale_fixers', []) + ['usort']
endif

if executable('shtuff')
  " Pre-requisites:
  " uv tool install shtuff
  " mkdir --parents pack/gitignored/opt
  " git -C pack/gitignored/opt clone https://github.com/vim-test/vim-test.git
  packadd vim-test
  let g:test#strategy = 'shtuff'
  let g:shtuff_receiver = 'test'
  let g:test#preserve_screen = 1
  let g:test#python#runner = 'pyunit'
  let g:test#python#pyunit#executable = 'py -m unittest'
  let g:test#python#pyunit#file_pattern = '\v^.*_test.py$'
  "let g:test#python#runner = 'pytest'
  "let g:test#python#pytest#executable = 'py -m pytest'

  function! TestOnWrite() range abort "{{{1
    " Configure an autogroup to test on write
    augroup test
      autocmd!
      autocmd BufWrite * if test#exists() |
        \   TestFile |
        \ endif
    augroup END
  endfunction "}}}1
endif
