" ftplugin/gitignore.vim
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call ale#fix#registry#Add(
  \ 'sort', 'ale#fixers#sort#Fix', ['gitignore'], 'sort file')
let b:ale_fixers = ['sort']
