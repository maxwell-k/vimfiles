" syntax/focus.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syntax match focusCode "`[^`]\+`"  conceal " to prevent other matches
syntax match focusHidden "^\(([A-Z]) \)\=\d\d\d\d-\d\d-\d\d " conceal
syntax match focusHidden "+[a-z-]\+ " conceal
syntax match focusHidden "@\w\+" conceal
syntax match focusHidden "due:\d\d\d\d-\d\d-\d\d " conceal
syntax match focusHidden +rec:[^ \t/]\S*+ conceal
syntax region focusLater start=/\%2l/ end=/\%$/ contains=@NoSpell conceal

highlight focusHidden guifg=#2D3640
highlight default link focusLater focusHidden
