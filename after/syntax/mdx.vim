"Disable spell checking from /usr/share/vim/vim81/syntax/html.vim
syn region htmlCommentPart contained start=+--+ end=+--\s*+
  \ contains=@htmlPreProc,@NoSpell
