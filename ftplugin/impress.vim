" ftplugin/impress.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Settings for impress.js presentations
" See https://github.com/impress/impress.js/
" Use as html.impress
"
" The impress progress bar relies on an empty div inside #impress-progressbar
" [tidy](https://www.w3.org/People/Raggett/tidy/) highlights this as an error
" the solution is to disable tidy
let b:ale_linters_ignore = ['tidy']
let b:match_ignorecase = 1
let b:match_words = '<:>,' .
\ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
\ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
\ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
