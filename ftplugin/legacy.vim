" ftplugin/legacy.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Python filetype settings for working on legacy Python code
"
" - No ALE fixers
" - flake8 doesn't warn about black formatting
" - flake8 knows about Python 2 builtins
"
let b:ale_fixers = []
" based upon https://github.com/psf/black/issues/429
let s:options = '--ignore='
let s:options .= 'B301,B302,B303,B304,B305,B306' " Python 3 from flake8-bugbear
" For compatiblity with Black
let s:options .= ',E101,E111,E114,E115,E116,E117,E121,E122,E123,E124,E125'
let s:options .= ',E126,E127,E128,E129,E131,E133,E2,E3,E5,E701,E702,E703'
let s:options .= ',E704,W1,W2,W3,W503,W504'
" Because fixing these breaks all tests
let s:options .= ',E702,E711,E712'
" To work on Python 2
" based upon https://github.com/psf/black/issues/429
let s:options .= ' --builtins=unicode,file'
let b:ale_python_flake8_options = s:options
