" after/syntax/xml.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syn region   xmlEndTag
    \ start=+</+ end=+>+
    \ contained
    \ contains=xmlNamespace,xmlAttribPunct,@xmlTagHook
hi link xmlEndTag xmlTag
