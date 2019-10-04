" see :help new-filetype option C
if exists('did_load_filetypes')
  finish
endif
augroup filetypedetect
  " **Tests in ./tests/file-type-detection/**
  "
  autocmd BufRead,BufNewFile APKBUILD setfiletype sh.apkbuild

  " For shebang based detection see also:
  " https://github.com/dart-lang/dart-vim-plugin/blob/master/ftdetect/dart.vim
  autocmd BufRead,BufNewFile *.dart setfiletype dart

  " based on runtime pack/ansible/opt/mdx/ftdetect/mdx.vim
  autocmd BufRead,BufNewFile *.mdx setfiletype markdown.mdx

  autocmd BufRead,BufNewFile *.bas setfiletype vba

  autocmd BufRead,BufNewFile known_hosts setfiletype known_hosts

  autocmd BufRead,BufNewFile *.vader setfiletype vader


  " **Tests described below**
  "
  " test with `man man`
  autocmd BufRead,BufNewFile /tmp/man.* setfiletype man
  " test with `fc` from inside dash
  autocmd BufRead,BufNewFile /tmp/_sh?????? setfiletype sh

augroup END
