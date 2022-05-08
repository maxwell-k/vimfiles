" ftplugin/reorder.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Install using pipx because
"
" > reorder-python-imports works best when entirely isolated
"
" https://github.com/asottile/reorder_python_imports/issues/95
"
" The specific problem that I encountered was the when installing a package as
" editable (e.g. flit install --symlink) it was miscategorised.
let g:ale_python_reorder_python_imports_use_global = 1
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['reorder-python-imports']
let b:ale_python_reorder_python_imports_options = '--py310-plus'
let b:ale_python_reorder_python_imports_options .=
  \ ' --application-directories=src'
