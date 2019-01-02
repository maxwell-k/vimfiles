setlocal foldexpr=rst#foldexpr(v:lnum)
setlocal foldmethod=expr
setlocal foldtext=getline(v:foldstart)
setlocal softtabstop=4
setlocal spell
setlocal textwidth=78
noremap <Leader>h :call rst#headings()<CR>

let b:ale_linters = ['rstcheckwarn', 'sed', 'rst2pseudoxml']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

setlocal makeprg=python3\ -c\ \"__import__('docutils.core').core.
setlocal makeprg+=publish_cmdline(writer_name='html')\"
setlocal makeprg+=\ --input-encoding=utf-8\ \"%\"\ \"~/.Downloads/%:t.html\"
augroup ftplugin_rst
  au!
  autocmd QuickFixCmdPre make noautocmd write
  autocmd QuickFixCmdPost make silent !ab ~/.Downloads/%:t.html
augroup END
