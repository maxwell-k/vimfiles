" ftplugin/javascript.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd javascript
let b:ale_fixers = ['prettier',]
setlocal suffixesadd=.js
setlocal nowrap
