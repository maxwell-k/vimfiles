" ftplugin/cog.vim
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use as markdown.cog or python.cog
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['cog']
