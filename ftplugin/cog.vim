" ftplugin/cog.vim
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call ale#fix#registry#Add('cog', 'ale#fixers#cog#Fix', ['cog'],
 \ 'Process with cog')
let b:ale_fixers = ['cog',]
