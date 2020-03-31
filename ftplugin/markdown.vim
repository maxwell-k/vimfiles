scriptencoding utf-8
setlocal listchars+=conceal:▭
setlocal spell
setlocal suffixesadd+=.md
setlocal textwidth=80

let b:ale_fixers = ['prettier',]
let b:ale_javascript_prettier_options = '--prose-wrap always --parser markdown'
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
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_fenced_languages = ['viml=vim']
let g:vim_markdown_strikethrough = 1
