" ftplugin/mdx.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd mdx

" in ./markdown.vim the parser is set to markdown, the line below clears that
let b:ale_javascript_prettier_options = '--prose-wrap always'
