" ftplugin/markdown-toc.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call ale#fix#registry#Add('markdown-toc', 'ale#fixers#markdown_toc#Fix',
  \ ['markdown-toc'], 'Add a table of contents with markdown-toc')
let b:ale_fixers += ['markdown-toc',]
