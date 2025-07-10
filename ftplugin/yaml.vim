" ftplugin/yaml.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
call vim#ConfigureModelineCompletion([
\ '# vim'.': set filetype=yaml :',
\ '# vim'.': set filetype=yaml.ansible :',
\ ])
if expand('%:p') !~# '/.github/workflows/'
  let b:ale_linters_ignore = ['actionlint']
endif
