" ftplugin/beancount.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd beancount
runtime OPT ftplugin/beancount.vim
setlocal expandtab
setlocal commentstring=;%s

" Fixers {{{
"
" Configuration for autoload/ale/fixers/beanformat.vim
if maktaba#string#EndsWith(&filetype, 'defaultwidth')
  let b:ale_beancount_beanformat_options = ''
else
  let b:ale_beancount_beanformat_options = '-w 64'
endif

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

" Insert mode completion {{{1
"
" omnifunc= is repeated from ~/.vim/vimrc to override
" pack/submodules/opt/beancount/ftplugin/beancount.vim
setl completefunc=beancount#complete
setl omnifunc=ale#completion#OmniFunc

" See pack/submodules/opt/beancount/doc/beancount.txt
let g:beancount_account_completion = 'chunks'

" Abbreviations {{{1
"
" Optionally load a sibling file called abbreviations.vim
execute ':silent! source '.expand('%:p:h').'/abbreviations.vim'

" vim: set foldmethod=marker foldlevel=0 : {{{1
