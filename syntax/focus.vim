" syntax/focus.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syntax match focusCode "`[^`]\+`"  " to prevent other matches
syntax match focusHidden "^\(([A-Z]) \)\=\d\d\d\d-\d\d-\d\d"
syntax match focusHidden "+[a-z-]\+"
syntax match focusHidden "@\w\+"
syntax match focusHidden "due:\d\d\d\d-\d\d-\d\d"
syntax match focusHidden +rec:[^ \t/]\S*+
syntax region focusLater start=/\%2l/ end=/\%$/ contains=@NoSpell

highlight focusHidden guifg=#2D3640
highlight default link focusLater focusHidden
