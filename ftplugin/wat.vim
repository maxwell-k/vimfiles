" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" ftplugin/wat.vim
"
" ALE Linter for Web Assembly Text
" See alse autoload/ale/handlers/wat2wasm.vim.
call ale#linter#Define('wat', {
\   'name': 'wat2wasm',
\   'callback': 'ale#handlers#wat2wasm#Handle',
\   'output_stream': 'stderr',
\   'executable': 'wat2wasm',
\   'command': '%e - --output=-',
\})
