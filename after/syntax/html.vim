"Must be in vim/after/syntax because vim/syntax is read before built in syntax
"rules
syn region htmlDel start="<del\>" end="</del\>" contains=@htmlTop
" Must be manually tweaked to match the font in vimrc
" Can't use guifont because, it can be a list of fonts
if has('gui_win32')
    highlight htmlDel font=Consolas:s
else
    highlight htmlDel cterm=reverse
endif
