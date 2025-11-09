" ftplugin/action.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" see also autoload/ale/handlers/zizmor.vim
call ale#linter#Define('action', {
\   'name': 'zizmor',
\   'executable': 'zizmor',
\   'command': '%e --format=json %t',
\   'callback': 'ale#handlers#zizmor#Handle',
\})
