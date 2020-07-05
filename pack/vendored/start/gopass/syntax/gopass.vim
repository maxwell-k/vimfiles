" pack/vendored/start/gopass/syntax/gopass.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" Example content:
"     header
"
"     secret password
"     ---
"     username: user
"     url: https://example.org
"
"     second secret password
"     ---
"     url: example.com
"     username: name@example.com
"     comment: example comment
"
"     vim: nowrap filetype=example.gopass
scriptencoding utf-8
if exists('b:current_syntax')
  finish
endif

syntax clear
syntax case match

if &filetype ==# 'gopass'
  syntax match gopassPassword /\%1l.*/ conceal cchar=🔒
else " temporary for use during migration
  syntax region gopassPassword start=/^$/ end=/---/me=e-4 conceal cchar=🔒

  syntax match gopassYamlDocumentStart /^---$/
  highlight link gopassYamlDocumentStart PreProc

  syntax region gopassModeline start=/\nvim:/ end=/$/ contains=@NoSpell
  highlight link gopassModeline Comment
endif

highlight link gopassPassword Special

syntax match gopassField /^comment:/
syntax match gopassField /^username:/
syntax match gopassField /^url:/

" based on syntax/markdown.vim
let s:cmd = 'syntax match gopassLink '
let s:cmd .= '/https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?'
let s:cmd .= '\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}'
let s:cmd .= '\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/'
execute s:cmd

highlight link gopassField Type
highlight link gopassLink Underlined

let b:current_syntax='gopass'
