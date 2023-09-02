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
" For a file with no extenstion, no shebang and a modeline setting filetype=sh
" https://github.com/vim/vim/blob/master/runtime/syntax/sh.vim
" sets b:is_kornehll. I never work with kornshell, so unlet b:is_kornshell and
" set b:is_posix
if exists('b:is_kornshell')
  unlet b:is_kornshell
  let b:is_posix=1
endif
