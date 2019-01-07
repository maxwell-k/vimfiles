" don't spell check modelines
syntax region htmlComment start=+<!+ end=+>+
  \ contains=htmlCommentPart,htmlCommentError,@Spell,htmlCommentModeline
syntax region htmlCommentModeline contained start=+-- vim:+ end=+--\s*+
  \ contains=@NoSpell
highlight link htmlCommentModeline Comment

" based upon https://github.com/plasticboy/vim-markdown/pull/367/
syntax region mkdStrike
  \ matchgroup=mkdDelimiter start=/\%(\~\~\)/ end=/\%(\~\~\)/ concealends
syntax cluster mkdNonListItem add=mkdStrike
highlight link mkdStrike htmlStrike

" Allow more groups in headings
syntax cluster mkdHeadingContains contains=mkdLink,mkdInlineURL,mkdCode
syn region htmlH1 matchgroup=mkdHeading start="^\s*#"      end="$"
  \ contains=@mkdHeadingContains,@Spell
syn region htmlH2 matchgroup=mkdHeading start="^\s*##"     end="$"
  \ contains=@mkdHeadingContains,@Spell
syn region htmlH3 matchgroup=mkdHeading start="^\s*###"    end="$"
  \ contains=@mkdHeadingContains,@Spell
syn region htmlH4 matchgroup=mkdHeading start="^\s*####"   end="$"
  \ contains=@mkdHeadingContains,@Spell
syn region htmlH5 matchgroup=mkdHeading start="^\s*#####"  end="$"
  \ contains=@mkdHeadingContains,@Spell
syn region htmlH6 matchgroup=mkdHeading start="^\s*######" end="$"
  \ contains=@mkdHeadingContains,@Spell
