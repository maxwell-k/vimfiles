" pack/vendored/start/gopass/syntax/gopass.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
scriptencoding utf-8
if exists('b:current_syntax')
  finish
endif
syntax match gopassSecret /\%1l./ conceal cchar=█
highlight Conceal guifg=fg
let b:current_syntax='gopass'
