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
" 5.1. Start completion               Ctrl+Space
" 5.2. Go to definition               <Leader>d  (includes recursive lookups)
let g:jedi#goto_definitions_command = '<leader>jd'
" 5.3. Go to assignment               <leader>g  [clashes]
let g:jedi#goto_assignments_command = '<leader>jg'
" 5.5. Show documentation             K
" 5.6. Rename variables               <leader>r
let g:jedi#rename_command = '<leader>jr'
" 5.7. Show name usages               <leader>n  [clashes]
let g:jedi#usages_command = '<leader>jn'
" 5.8. Open module by name            :Pyimport
let b:ale_linters = ['flake8', 'pyright']
let b:ale_python_flake8_options = '--max-line-length=88'
