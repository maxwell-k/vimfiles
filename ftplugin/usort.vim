" ftplugin/usort.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" See also autoload/ale/fixers/usort.vim
execute ale#fix#registry#Add(
  \ 'usort',
  \ 'ale#fixers#usort#Fix',
  \ ['python'],
  \ 'sort Python imports with usort via uv'
  \ )
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['usort']
