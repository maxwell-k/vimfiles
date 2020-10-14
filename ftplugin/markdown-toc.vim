" ftplugin/markdown-toc.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
noremap <Leader>] yi]:tag <C-R>"<CR>
let s:cmd = 'ctags -f '.expand('%:h').'/tags '.expand('%')
execute 'autocmd BufWritePost <buffer> silent !'.s:cmd

call ale#fix#registry#Add('markdown-toc', 'ale#fixers#markdown_toc#Fix',
  \ ['markdown-toc'], 'Add a table of contents with markdown-toc')
let b:ale_fixers += ['markdown-toc',]
