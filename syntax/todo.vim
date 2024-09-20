" syntax/todo.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Bespoke syntax configuration for todo.txt files is available in
" ./after/syntax/todo.vim
"
" These lines are necessary to avoid errors with `vim todo.txt`
packadd todo.txt
runtime OPT syntax/todo.vim
