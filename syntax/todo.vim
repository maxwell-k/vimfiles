" syntax/todo.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd todo.txt
runtime OPT syntax/todo.vim
highlight def link TodoProject Question
syntax match TodoURL =[(<]\?https\?://\S*[)>]\?=
syntax region TodoCancel start=/\~\~/ end=/\~\~/
syntax match TodoDone '^[x]\s.\+$'
  \ contains=TodoKey,TodoDate,TodoProject,TodoContext,TodoURL,TodoCancel
