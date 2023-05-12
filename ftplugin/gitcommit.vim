" ftplugin/gitcommit.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal spell

" so that GitHub formats indented blocks as code in PR messages:
setlocal softtabstop=4 shiftwidth=4

augroup gitcommit
  autocmd!
  autocmd VimEnter * normal gg
augroup END
