" see :help new-filetype option C
if exists('did_load_filetypes')
  finish
endif
augroup filetypedetect
" Tests in ./tests/file-type-detection/

  autocmd BufRead,BufNewFile *.bas setfiletype vba
  autocmd BufRead,BufNewFile *.dart setfiletype dart
  autocmd BufRead,BufNewFile *.gfm setfiletype markdown.gfm
  autocmd BufRead,BufNewFile *.mdx setfiletype markdown.mdx
  autocmd BufRead,BufNewFile *.svelte setfiletype html.svelte
  autocmd BufRead,BufNewFile *.tf setfiletype terraform
  autocmd BufRead,BufNewFile *.tfstate setfiletype javascript
  autocmd BufRead,BufNewFile *.tfvars setfiletype terraform
  autocmd BufRead,BufNewFile *.vader setfiletype vader
  autocmd BufRead,BufNewFile */example.yaml setfiletype yaml.ansible
  autocmd BufRead,BufNewFile */planning/*.txt setfiletype rst.automatic
  autocmd BufRead,BufNewFile */planning/tlf/*.txt setfiletype text
  autocmd BufRead,BufNewFile */playbooks/*.yaml setfiletype yaml.ansible
  autocmd BufRead,BufNewFile */site-packages/**.py setfiletype python
  autocmd BufRead,BufNewFile APKBUILD setfiletype sh.apkbuild
  autocmd BufRead,BufNewFile hosts setfiletype yaml.ansible.hosts " [1]
  autocmd BufRead,BufNewFile known_hosts setfiletype known_hosts

  " [1] also need to clear augroup ansible_vim_fthosts see
  " ./after/ftplugin/ansible.vim

" Tests described below

  autocmd BufRead,BufNewFile /home/**.py setfiletype python.black
  autocmd BufRead,BufNewFile /tmp/_sh?????? setfiletype sh
  autocmd BufRead,BufNewFile /tmp/man.* setfiletype man

  " `vim ~/example.py`: python.black
  " `fc` inside dash: sh
  " `man man`: man

augroup END
