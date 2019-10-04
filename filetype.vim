" see :help new-filetype option C
if exists('did_load_filetypes')
  finish
endif
augroup filetypedetect
  autocmd BufRead,BufNewFile APKBUILD setfiletype sh.apkbuild
  " For shebang based detection see also:
  " https://github.com/dart-lang/dart-vim-plugin/blob/master/ftdetect/dart.vim
  autocmd BufRead,BufNewFile *.dart set filetype=dart
augroup END
