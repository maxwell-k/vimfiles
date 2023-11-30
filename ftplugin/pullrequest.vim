" ftplugin/pullrequest.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Filetype for working with
" https://hub.github.com/
" https://github.com/mislav/hub
setlocal textwidth=0
setlocal spell
setlocal nolinebreak

let b:ale_linter_aliases = {'pullrequest': 'markdown'}
let b:ale_fixers = ['prettier']
let b:ale_javascript_prettier_options = '--prose-wrap never --parser markdown'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_strikethrough = 1
