" after/syntax/mdx.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Usage example:
"
"     :set filetype=markdown.htmlCommentNoSpell
"
"Disable spell checking from /usr/share/vim/vim??/syntax/html.vim
"https://github.com/vim/vim/blob/master/runtime/syntax/html.vim
" 2 lines below are repeated from ./html.vim
syntax keyword htmlTodo contained TODO FIXME
highlight link htmlTodo Todo
syn region htmlComment matchgroup=htmlComment
  \ start=+<!--\%(-\?>\)\@!+
  \ end=+--!\?>+
  \ contains=htmlCommentNested,@htmlPreProc,@NoSpell,htmlTodo
  \ keepend
