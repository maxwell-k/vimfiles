scriptencoding utf-8
" colors/mine.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" All custom colours for todo.txt are in after/syntax/todo.vim so there is a
" single level of priority
"
runtime colors/ayu.vim

let g:colors_name='mine'
" hex codes from pack/submodules/start/ayu/colors/ayu.vim
" `:sort` everything below
highlight ColorColumn guibg=#253340
highlight CursorLine guibg=#3E4B59
highlight Folded guibg=NONE guifg=sienna
highlight NonText guifg=#F29718
highlight Normal guibg=NONE
highlight SignColumn guibg=#FFD57F
highlight SpecialKey cterm=bold guifg=#cb4b16
highlight SpellRare cterm=NONE
highlight Statement guifg=#E6B673
highlight StatusLine guibg=#828C99 guifg=#14191F
highlight StatusLineNC guibg=#3E4B59 guifg=#000000
