scriptencoding utf-8
setlocal conceallevel=1
setlocal listchars+=conceal:▭
setlocal spell
setlocal suffixesadd+=.md
setlocal textwidth=80

let b:ale_fixers = ['prettier',]
let b:ale_javascript_prettier_options = '--prose-wrap always --parser markdown'
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_fenced_languages = ['viml=vim']
