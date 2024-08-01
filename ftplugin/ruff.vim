" ftplugin/ruff.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let b:ale_linters = get(b:, 'ale_fixers', []) + ['ruff']
