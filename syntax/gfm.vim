" syntax/gfm.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syntax keyword embedme embedme
highlight link embedme Keyword
syn region htmlCommentPart contained start=+--+ end=+--\s*+
  \ contains=@htmlPreProc,@NoSpell,embedme
