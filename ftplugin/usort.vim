" ftplugin/usort.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let s:desc =  'sort Python imports with usort'
let s:func =  'ale#fixers#usort#Fix'
execute ale#fix#registry#Add('usort', s:func, ['python'], s:desc)
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['usort']
