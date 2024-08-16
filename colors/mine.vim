" colors/mine.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let s:ayu =expand('<sfile>:h').'/../pack/submodules/start/ayu/colors/ayu.vim'
execute 'source '.resolve(s:ayu)

let g:colors_name='mine'
" hex codes from pack/submodules/start/ayu/colors/ayu.vim
highlight NonText guifg=#F29718
highlight SignColumn guibg=#FFD57F
highlight Folded guifg=#F07178
highlight StatusLine guibg=#828C99 guifg=#14191F
highlight StatusLineNC guibg=#3E4B59 guifg=#000000
highlight SpecialKey gui=bold guifg=#cb4b16
highlight Statement guifg=#E6B673
highlight ToDoOverDueDate cterm=bold guifg=#F07178
highlight CursorLine guibg=#3E4B59
highlight ToDoPriorityA cterm=bold
highlight TodoCancel cterm=strikethrough guifg=#5C6773
highlight link ToDoPriorityB NONE
highlight link ToDoPriorityC NONE
highlight link TodoCode String
highlight TodoProject guifg=LimeGreen
highlight link TodoURL Underlined
