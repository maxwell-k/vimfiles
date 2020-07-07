" syntax/markdown-toc.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" https://github.com/jonschlinkert/markdown-toc#cli
syntax keyword markdownTableOfContents toc tocstop
highlight link markdownTableOfContents Keyword
syn region htmlComment start=/<!-- toc/ end=/>/
  \ contains=@NoSpell,markdownTableOfContents
