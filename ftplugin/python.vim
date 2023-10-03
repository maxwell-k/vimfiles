" ftplugin/python.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Python filetype settings for working on any Python code
"
setlocal commentstring=#\ %s
setlocal foldtext=PythonFoldText()
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal suffixesadd+=.py
unlet! b:ale_fixers  " reset for use in autoload/toggle.vim
call toggle#toggle_python_linters('default')
noremap <Leader>pp :call toggle#toggle_python()<CR>
noremap <Leader>pl :call toggle#toggle_python_linters()<CR>
noremap <Leader>pt
  \ :exec 'new '. substitute(expand('%'), '.py$', '_test.py', '')<CR>
noremap <Leader>pT
  \ :exec 'above new '. substitute(expand('%'), '_test.py$', '.py', '')<CR>
noremap K :call python#documentation()<CR>

" Settings for https://github.com/vim-test/vim-test
packadd test-vim
let g:test#python#runner = 'pyunit'
let g:test#python#pyunit#executable = 'py -m unittest'
let g:test#python#pyunit#file_pattern = '\v^.*_test.py$'
"let g:test#python#runner = 'pytest'
"let g:test#python#pytest#executable = 'py -m pytest'
let g:shtuff_receiver = 'test'
let g:test#strategy = 'shtuff'
let g:test#preserve_screen = 1


nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

function! TestOnWrite() range abort "{{{1
  augroup test
    autocmd!
    autocmd BufWrite * if test#exists() |
      \   TestFile |
      \ endif
  augroup END
endfunction "}}}1
