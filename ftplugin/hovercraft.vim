setlocal foldexpr=hovercraft#foldexpr(v:lnum)
setlocal foldmethod=expr
setlocal foldtext=substitute(getline(v:foldstart+2),':id:\ ','','')
