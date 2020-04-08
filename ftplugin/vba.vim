" ftplugin/vba.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
scriptencoding utf-8
highlight clear Folded
highlight link Folded Comment
setlocal fillchars+=fold:…
setlocal foldmethod=syntax
setlocal foldtext=vba#foldtext()
setlocal spell
let b:ale_linter_aliases = {'vba': 'vim'}
let b:ale_linters = ['sed']
