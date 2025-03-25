" ftplugin/action.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let b:ale_linters = ['actionlint', 'yamllint']

" load an actionlint config at .github/actionlint.yaml
let s:path = system('git rev-parse --show-toplevel --path-format=absolute')
let s:path = substitute(s:path, '\n$', '', '')
let s:path .= '/.github/actionlint.yaml'
if filereadable(s:path)
  let b:ale_yaml_actionlint_options = '-config-file '.s:path
endif
