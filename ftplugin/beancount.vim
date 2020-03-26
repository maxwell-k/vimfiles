" ftplugin/beancount.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd beancount
runtime OPT ftplugin/beancount.vim
setlocal commentstring=;%s
let g:ale_beancount_beanformat_options = '-w 64'
call ale#fix#registry#Add('beanformat', 'ale#fixers#beanformat#Fix',
  \ ['beancount'], 'Format with bean-format')
let b:ale_fixers = ['beanformat', 'trim_whitespace',]
" bean_check ale_linter is from https://github.com/nathangrigg/vim-beancount
let b:ale_linters=['bean_check',]
