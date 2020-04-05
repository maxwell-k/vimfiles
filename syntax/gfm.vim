syntax keyword embedme embedme
highlight link embedme Keyword
syn region htmlCommentPart contained start=+--+ end=+--\s*+
  \ contains=@htmlPreProc,@NoSpell,embedme
