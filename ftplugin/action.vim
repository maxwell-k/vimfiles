" ftplugin/action.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let b:ale_linters = ['actionlint', 'yamllint']
let b:ale_yaml_actionlint_options = '-oneline -no-color -'
