" ftplugin/markdown.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"

" sourced early so that we can override settings like textwidth
runtime ftplugin/todo.vim

scriptencoding utf-8
setlocal listchars+=conceal:▭
setlocal spell
setlocal suffixesadd+=.md
setlocal textwidth=80

let b:ale_fixers = get(b:, 'ale_fixers', []) + ['prettier']
let b:ale_javascript_prettier_options = '--prose-wrap always'
let g:vim_markdown_toc_autofit = 1
if !exists('g:vim_markdown_folding_disabled')
  " Disabled by default because horizontal rules, ---, are misinterpreted as
  " headings
  "
  " Set inside a conditional, so that the following will enable folding:
  " :let g:vim_markdown_folding_disabled=0 | edit
  let g:vim_markdown_folding_disabled = 1
  " See also g:vim_markdown_folding_style_pythonic
endif

" default mappings for gx and ge don't work, so disable them all
let g:vim_markdown_no_default_key_mappings = 1
" add working default mappings from
" https://github.com/plasticboy/vim-markdown/blob/master/ftplugin/markdown.vim
function! s:MapNotHasmapto(lhs, rhs)
    if !hasmapto('<Plug>' . a:rhs)
        execute 'nmap <buffer>' . a:lhs . ' <Plug>' . a:rhs
        execute 'vmap <buffer>' . a:lhs . ' <Plug>' . a:rhs
    endif
endfunction
call <sid>MapNotHasmapto(']]', 'Markdown_MoveToNextHeader')
call <sid>MapNotHasmapto('[[', 'Markdown_MoveToPreviousHeader')
call <sid>MapNotHasmapto('][', 'Markdown_MoveToNextSiblingHeader')
call <sid>MapNotHasmapto('[]', 'Markdown_MoveToPreviousSiblingHeader')
call <sid>MapNotHasmapto(']u', 'Markdown_MoveToParentHeader')
call <sid>MapNotHasmapto(']c', 'Markdown_MoveToCurHeader')

let g:vim_markdown_fenced_languages = ['viml=text', 'vim=text', 'py=python']
let g:vim_markdown_strikethrough = 1


call vim#ConfigureModelineCompletion(map([
\ 'filetype=markdown.gfm nowrap',
\ 'filetype=markdown.markdown-toc',
\ 'filetype=markdown.htmlCommentNoSpell',
\ 'filetype=markdown.embedme',
\ ], {idx, choice -> '<!-- vim'.': set '.choice.'  : -->'}))
" the line above contains additional concatenations so that it is not
" recognised as a mode line
