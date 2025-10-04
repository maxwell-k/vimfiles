" after/syntax/markdown.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" don't spell check block quotes

syntax region markdownBlockquote start=/^\s*>/ end=/$/
  \ contains=@NoSpell,markdownAutomaticLink

" don't spell check modelines
" see ./html.vim - if html is loaded last its priority - :help syn-priority
syntax cluster mkdNonListItem add=htmlModeline

" don't spell check words in quotes
syntax match mkdWordInQuotes '\v["'][^"']*['"]' contains=@NoSpell
syntax match mkdWordInQuotes '\v["'][^"']*['"]' contains=@NoSpell
  \ contained containedin=ALL transparent
syntax cluster mkdNonListItem add=mkdWordInQuotes
syntax cluster mkdHeadingContains add=mkdWordInQuotes

syntax clear markdownIdDeclaration
syntax region markdownIdDeclaration
  \ matchgroup=markdownLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:"
  \ oneline keepend nextgroup=markdownUrl skipwhite skipnl

syntax keyword embedme contained embedme
highlight default link embedme Keyword
syn region htmlComment start=/<!-- embedme/ end=/>/ contains=@NoSpell,embedme
