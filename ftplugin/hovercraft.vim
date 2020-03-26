" ftplugin/hovercraft.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal foldexpr=hovercraft#foldexpr(v:lnum)
setlocal foldmethod=expr
setlocal foldtext=substitute(getline(v:foldstart+2),':id:\ ','','')
