" ftplugin/markdown.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
scriptencoding utf-8
setlocal listchars+=conceal:▭
setlocal spell
setlocal suffixesadd+=.md
setlocal textwidth=80

let b:ale_fixers = get(b:, 'ale_fixers', [])
if index(b:ale_fixers, 'prettier') == -1
  let b:ale_fixers += ['prettier']
endif

let b:ale_javascript_prettier_options = '--prose-wrap always'


call vim#ConfigureModelineCompletion(map([
\ 'filetype=markdown.gfm nowrap',
\ 'filetype=markdown.markdown-toc',
\ 'filetype=markdown.htmlCommentNoSpell',
\ 'filetype=markdown.markdown-toc.htmlCommentNoSpell',
\ 'filetype=markdown.embedme',
\ ], {idx, choice -> '<!-- vim'.': set '.choice.' : -->'}))
" the line above contains additional concatenations so that it is not
" recognised as a mode line

if &filetype =~# 'embedme' " for example filetype=markdown.embedme
  let b:ale_fixers =  ['embedme'] + get(b:, 'ale_fixers', [])
endif

" /usr/share/vim/vim91/ftplugin/markdown.vim
let g:markdown_folding = 1
