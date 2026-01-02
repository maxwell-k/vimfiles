" ftplugin/beancount.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd beancount
runtime OPT ftplugin/beancount.vim
setlocal expandtab
setlocal commentstring=;%s
if maktaba#string#EndsWith(&filetype, 'defaultwidth')
  let b:ale_beancount_beanformat_options = ''
else
  let b:ale_beancount_beanformat_options = '-w 64'
endif
" See pack/submodules/opt/beancount/ale_linters/beancount/bean_check.vim

" Language Server {{{1
"
" See :help ale-lint-language-servers
call ale#linter#Define('beancount', {
\   'name': 'beancount-language-server',
\   'lsp': 'stdio',
\   'executable': 'beancount-language-server',
\   'command': '%e',
\   'project_root': function('vim#GitProjectRoot'),
\   'initialization_options': {
\      'journal_file': expand('%:p')
\    }
\})

let g:beancount_account_completion = 'chunks'

" optionally load a file called abbreviations in the same directory
execute ':silent! source '.expand('%:p:h').'/abbreviations.vim'
