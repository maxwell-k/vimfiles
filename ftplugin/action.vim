" ftplugin/action.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" load an actionlint config at .github/actionlint.yaml
let s:path = vim#Cdup() . '/.github/actionlint.yaml'
if filereadable(s:path)
  let b:ale_yaml_actionlint_options = '-config-file '.s:path
endif
