"Also sourced from reStructuredText and Python
scriptencoding utf-8
if &filetype ==# 'sql'
  setlocal foldmethod=syntax
  setlocal fillchars+=fold:…
  setlocal foldtext=sql#foldtext()
  noremap <buffer> <C-L> :noh<CR>:DBResultsClose<CR><C-L>
  DBCheckModeline
endif
