" ftplugin/rst.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
setlocal foldexpr=rst#foldexpr(v:lnum)
setlocal foldmethod=expr
setlocal foldtext=getline(v:foldstart)
setlocal softtabstop=4
setlocal spell
setlocal textwidth=78
noremap <Leader>h :call rst#headings()<CR>

let b:ale_linter_aliases = {'rst': 'vim'}
let b:ale_linters = ['rstcheckwarn', 'sed', 'rst2pseudoxml']
let b:ale_rst_rst2pseudoxml_executable = 'rst2pseudoxml-3'

let &l:makeprg = "python3 -c '__import__(\"docutils.core\").core."
  \ . "publish_cmdline(writer_name=\"html\")'"
  \ . ' --input-encoding=utf-8 '
  \ . expand('"%" "$HOME/.Downloads/%:t.html"')
augroup ftplugin_rst
  autocmd!
  autocmd QuickFixCmdPre make noautocmd write
  autocmd QuickFixCmdPost make silent !ab ~/.Downloads/%:t.html
augroup END
