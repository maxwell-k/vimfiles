" syntax/moment.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syntax region momentLater start=/\%2l/ end=/\%$/ contains=@NoSpell
syntax match momentDate "^\(([A-Z]) \)\=\d\d\d\d-\d\d-\d\d"
syntax match momentCode "`[^`]\+`"  " to prevent other matches
syntax match momentProject "+[a-z-]\+"
syntax match momentContext "@\w\+"
syntax match momentDue "due:\d\d\d\d-\d\d-\d\d"
syntax match momentHidden +rec:[^ \t/]\S*+

highlight momentHidden guifg=#2D3640
highlight default link momentDate momentHidden
highlight default link momentLater momentHidden
highlight default link momentProject momentHidden
highlight default link momentDue momentHidden
highlight default link momentContext momentHidden
