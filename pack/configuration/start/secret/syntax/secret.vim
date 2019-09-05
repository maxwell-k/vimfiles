scriptencoding utf-8
if exists('b:current_syntax')
  finish
endif
syntax case match
syntax match secretSecret /^.* Secret$/ conceal cchar=█
highlight Conceal guifg=fg
let b:current_syntax='secret'
