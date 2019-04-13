setlocal foldexpr=rst#foldexpr(v:lnum)
setlocal foldmethod=expr
setlocal foldtext=getline(v:foldstart)
setlocal softtabstop=4
setlocal spell
setlocal textwidth=78
noremap <Leader>h :call rst#headings()<CR>

let b:ale_linters = ['rstcheckwarn', 'sed', 'rst2pseudoxml']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

let &l:makeprg = "python3 -c '__import__(\"docutils.core\").core."
  \ . "publish_cmdline(writer_name=\"html\")'"
  \ . ' --input-encoding=utf-8 '
  \ . expand('"%" "$HOME/.Downloads/%:t.html"')
augroup ftplugin_rst
  autocmd!
  autocmd QuickFixCmdPre make noautocmd write
  autocmd QuickFixCmdPost make silent !ab ~/.Downloads/%:t.html
augroup END
