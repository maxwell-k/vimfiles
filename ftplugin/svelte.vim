" ftplugin/svelte.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd svelte
" Assume project has eslint-plugin-svelte3 & prettier-plugin-svelte configured
let b:ale_linter_aliases = {'svelte': 'javascript'}
let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier']
