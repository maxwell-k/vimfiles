" ftplugin/jsonnet.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd jsonnet
let g:jsonnet_fmt_on_save = 0
" See :help ale-lint-language-servers
call ale#linter#Define('jsonnet', {
\   'name': 'jsonnet-language-server',
\   'lsp': 'stdio',
\   'executable': 'jsonnet-language-server',
\   'command': '%e',
\   'project_root': function('vim#GitProjectRoot'),
\})
