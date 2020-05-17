" after/syntax/mdx.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Usage example:
"
"     :set filetype=markdown.htmlCommentNoSpell
"
"Disable spell checking from /usr/share/vim/vim81/syntax/html.vim
syn region htmlCommentPart contained start=+--+ end=+--\s*+
  \ contains=@htmlPreProc,@NoSpell
