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
let b:ale_python_flake8_options = '--max-line-length=88'
noremap <Leader>pp :call toggle#toggle_python()<CR>
noremap <Leader>pl :call toggle#toggle_python_linters()<CR>
noremap <Leader>pi :call toggle#toggle_python_import_ordering()<CR>
noremap <Leader>pt
  \ :exec 'new '. substitute(expand('%'), '.py$', '_test.py', '')<CR>
noremap <Leader>pT
  \ :exec 'new '. substitute(expand('%'), '_test.py$', '.py', '')<CR>
