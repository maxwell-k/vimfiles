" after/syntax/sh.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Don't spell check quoted strings in sh
syn region  shSingleQuote matchgroup=shQuote start=+'+ end=+'+
  \ contains=@NoSpell
syn region  shDoubleQuote matchgroup=shQuote start=+\%(\%(\\\\\)*\\\)\@<!"+
  \ skip=+\\"+ end=+"+ contains=@shDblQuoteList,shStringSpecial,@NoSpell
syn region  shBkslshSnglQuote contained matchgroup=shQuote
  \ start=+'+ end=+'+ contains=@NoSpell
syn region  shBkslshDblQuote contained matchgroup=shQuote
  \ start=+"+ skip=+\\"+ end=+"+
  \ contains=@shDblQuoteList,shStringSpecial,@NoSpell
syn cluster shCommentGroup contains=shTodo,@Spell
