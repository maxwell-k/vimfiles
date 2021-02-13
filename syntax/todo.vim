" syntax/todo.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syntax keyword embedme embedme
highlight link embedme Keyword
syn region htmlComment start=/<!-- embedme/ end=/>/ contains=@NoSpell,embedme
highlight  default  link  TodoPriorityA  Identifier
highlight  default  link  TodoPriorityB  Identifier
highlight  default  link  TodoPriorityC  Identifier
