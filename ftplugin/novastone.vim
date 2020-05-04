" ftplugin/novastone.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Use as set filetype=python.novastone
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['black']
let b:ale_python_flake8_options = '--ignore=E501 --builtins=unicode'
