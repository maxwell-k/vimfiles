" ftplugin/embedme.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call ale#fix#registry#Add('embedme', 'ale#fixers#embedme#Fix',
  \ ['embedme'], 'Embed snippets with embedme')
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['embedme']
