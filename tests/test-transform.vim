" tests/test-transform.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Run with: vim "+source test-transform.vim"
" For efficient development replace the local copy of opfunc.vim in
" /usr/share/vim/vimfiles/autoload/ with a symbolic link file.
let s:issues = 0
let s:issues += opfunc#transform('0') !=# '0'
let s:issues += opfunc#dedent('  1') !=# '1'
let s:issues += opfunc#transform('  2') !=# '2'
let s:issues += opfunc#transform("  3 \\\n  4") !=# '3 4'
let s:issues += opfunc#transform("5 ^\n6") !=# '5 6'
let s:issues += opfunc#transform('7  8') !=# '7 8'
let s:issues += opfunc#transform("# 9\n# 10") !=# '9 10'
let s:issues += opfunc#transform("11\n12") !=# '11 12'
let s:issues += opfunc#transform("13\n14 ") !=# '13 14'
let s:issues += opfunc#transform("15\n\\ 16") !=# '15 16'
let s:issues += opfunc#transform("  17\n    \\ 18") !=# '17 18'
let s:issues += opfunc#transform('19	20') !=# '19 20'
if s:issues > 0
  cq
else
  quit
endif
