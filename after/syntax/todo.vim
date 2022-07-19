" after/syntax/todo.vim
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Avoid key:value syntax clashing with links like https://...
"
" The original syntax pattern for this syntax matches markdown link syntax
" like the example below:
"
"   [example link](https//example.org)
"
" Adding a restiction that value cannot start with / means that markdown links
" are not highlighted as key:value pairs.
"
" https://github.com/todotxt/todo.txt#additional-file-format-definitions
"
" According to :help \S, \S is equivalent to [^ \t]
"
" See also:
" ./syntax/todo.vim
" ./tests/manual/todo.txt
" ./pack/submodules/opt/todo.txt/syntax/todo.vim
"
syntax  clear  TodoKey
" The original pattern was:   '\S*\S:\S\S*'
syntax  match  TodoKey        '\S*\S:[^ \t/]\S*' contains=TodoDate
