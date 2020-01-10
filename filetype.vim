" see :help new-filetype option C
if exists('did_load_filetypes')
  finish
endif
augroup filetypedetect
" Sorted based on the autocmd-patterns
"
" Tests in ./tests/file-type-detection/

  autocmd BufRead,BufNewFile APKBUILD setfiletype sh.apkbuild

  autocmd BufRead,BufNewFile known_hosts setfiletype known_hosts

  autocmd BufRead,BufNewFile *.bas setfiletype vba

  " For shebang based detection see also:
  " https://github.com/dart-lang/dart-vim-plugin/blob/master/ftdetect/dart.vim
  autocmd BufRead,BufNewFile *.dart setfiletype dart

  autocmd BufRead,BufNewFile *.gfm setfiletype markdown.gfm

  " based on runtime pack/ansible/opt/mdx/ftdetect/mdx.vim
  autocmd BufRead,BufNewFile *.mdx setfiletype markdown.mdx

  autocmd BufRead,BufNewFile *.svelte setfiletype html.svelte

  autocmd BufRead,BufNewFile *.tf setfiletype terraform
  autocmd BufRead,BufNewFile *.tfvars setfiletype terraform
  autocmd BufRead,BufNewFile *.tfstate setfiletype javascript

  autocmd BufRead,BufNewFile *.vader setfiletype vader

  autocmd BufRead,BufNewFile */site-packages/**.py setfiletype python

  autocmd BufRead,BufNewFile */planning/tlf/*.txt setfiletype text
  autocmd BufRead,BufNewFile */planning/*.txt setfiletype rst.automatic

  autocmd BufRead,BufNewFile */example.yaml setfiletype yaml.ansible
  autocmd BufRead,BufNewFile */playbooks/*.yaml setfiletype yaml.ansible

  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible.hosts
  " need to clear augroup ansible_vim_fthosts

" Tests described below

  " test with `man man`
  autocmd BufRead,BufNewFile /tmp/man.* setfiletype man
  " test with `fc` from inside dash
  autocmd BufRead,BufNewFile /tmp/_sh?????? setfiletype sh
  " test with `vim ~/example.py`
  autocmd BufRead,BufNewFile /home/**.py setfiletype python.black

augroup END
