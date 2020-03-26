" pack/configuration/opt/jupyter/plugin/jupyter.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
command! -nargs=+ Jupyter :call jupyter#command(<q-args>)

" Mappings
call opfunc#opfuncmap('j', 'jupyter') " run in jupyter
nmap <Leader>J :call jupyter#toggle()<CR>

" Allow jupyter mappings to work against virtualenv
python3 __import__("sys").path.insert(0,
  \ "/opt/jupyter/lib/python3.8/site-packages")
