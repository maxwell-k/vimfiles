" based upon https://github.com/plasticboy/vim-markdown/pull/367/
" highlight strike through, built in support isn't functioning
syntax region mkdStrike
  \ matchgroup=mkdDelimiter start=/\%(\~\~\)/ end=/\%(\~\~\)/ concealends
syntax cluster mkdNonListItem add=mkdStrike
highlight link mkdStrike htmlStrike

" don't spell check block quotes
syn region mkdBlockquote start=/^\s*>/ end=/$/
  \ contains=mkdLink,mkdInlineURL,mkdLineBreak,@NoSpell

" don't spell check modelines
" see ./html.vim - if html is loaded last its priority - :help syn-priority
syntax cluster mkdNonListItem add=htmlModeline

" allow more groups in headings
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

" don't spell check words in double quotes
syntax match mkdWordInQuotes '\v"[^"]*"' transparent contains=@NoSpell
syntax match mkdWordInQuotes "\v'[^']*'" transparent contains=@NoSpell
syntax cluster mkdNonListItem add=mkdWordInQuotes
syntax cluster mkdHeadingContains add=mkdWordInQuotes
