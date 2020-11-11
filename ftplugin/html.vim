" ftplugin/html.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
if &filetype ==# 'html'
  let b:ale_fixers = ['prettier',]
endif
