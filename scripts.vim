" scripts.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" See :help new-filetype-scripts
" See also ./filetype.vim
if did_filetype()
  finish
endif
" Tests in ./tests/file-type-detection/
if expand('%:p') =~# '.*/keith.maxwell/.*' && getline(1) =~# '^#!.*python'
  set filetype=python.black.personal
endif
