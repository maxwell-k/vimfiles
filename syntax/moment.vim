" syntax/moment.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syntax match momentCode "`[^`]\+`"  " to prevent other matches
syntax match momentHidden "^\(([A-Z]) \)\=\d\d\d\d-\d\d-\d\d"
syntax match momentHidden "+[a-z-]\+"
syntax match momentHidden "@\w\+"
syntax match momentHidden "due:\d\d\d\d-\d\d-\d\d"
syntax match momentHidden +rec:[^ \t/]\S*+
syntax region momentLater start=/\%2l/ end=/\%$/ contains=@NoSpell

highlight momentHidden guifg=#2D3640
highlight default link momentLater momentHidden
