" don't spell check block quotes
syntax region mkdBlockquote start=/^\s*>/ end=/$/
  \ contains=mkdLink,mkdInlineURL,mkdLineBreak,@NoSpell

" don't spell check modelines
" see ./html.vim - if html is loaded last its priority - :help syn-priority
syntax cluster mkdNonListItem add=htmlModeline

" allow more groups in headings
syntax cluster mkdHeadingContains contains=mkdLink,mkdInlineURL,mkdCode
syntax region htmlH1 matchgroup=mkdHeading start="^\s*#"      end="$"
  \ contains=@mkdHeadingContains,@Spell
syntax region htmlH2 matchgroup=mkdHeading start="^\s*##"     end="$"
  \ contains=@mkdHeadingContains,@Spell
syntax region htmlH3 matchgroup=mkdHeading start="^\s*###"    end="$"
  \ contains=@mkdHeadingContains,@Spell
syntax region htmlH4 matchgroup=mkdHeading start="^\s*####"   end="$"
  \ contains=@mkdHeadingContains,@Spell
syntax region htmlH5 matchgroup=mkdHeading start="^\s*#####"  end="$"
  \ contains=@mkdHeadingContains,@Spell
syntax region htmlH6 matchgroup=mkdHeading start="^\s*######" end="$"
  \ contains=@mkdHeadingContains,@Spell

" don't spell check words in quotes
syntax match mkdWordInQuotes '\v"[^"]*"' contains=@NoSpell
" the line below is fooled by contractions with '
syntax match mkdWordInQuotes "\v'[^']*'" contains=@NoSpell
syntax cluster mkdNonListItem add=mkdWordInQuotes
syntax cluster mkdHeadingContains add=mkdWordInQuotes
