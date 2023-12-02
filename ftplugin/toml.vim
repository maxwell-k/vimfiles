" ftplugin/toml.vim
" Copyright 2023 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal nowrap
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['dprint']
