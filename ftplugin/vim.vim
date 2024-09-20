" ftplugin/vim.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
if expand('%:p') =~# '/filetype.gitignored.vim'
    let b:ale_linters_ignore=['sed']
endif
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
