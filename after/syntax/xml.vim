syn region   xmlEndTag
    \ start=+</+ end=+>+
    \ contained
    \ contains=xmlNamespace,xmlAttribPunct,@xmlTagHook
hi link xmlEndTag xmlTag
