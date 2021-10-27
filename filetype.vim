" filetype.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" See :help new-filetype option C
" See also ./scripts.vim
"
if exists('did_load_filetypes')
  finish
endif
augroup filetypedetect
" Tests in ./tests/file-type-detection/

  autocmd BufRead,BufNewFile .ansible-lint setfiletype yaml
  autocmd BufRead,BufNewFile .env setfiletype text
  autocmd BufRead,BufNewFile *.bas setfiletype vba
  autocmd BufRead,BufNewFile *.beancount setfiletype beancount
  autocmd BufRead,BufNewFile *.dart setfiletype dart
  autocmd BufRead,BufNewFile *.docker setfiletype dockerfile
  autocmd BufRead,BufNewFile *.gfm setfiletype markdown.gfm
  autocmd BufRead,BufNewFile *.mdx setfiletype markdown.mdx
  autocmd BufRead,BufNewFile *.svelte setfiletype svelte
  autocmd BufRead,BufNewFile *.tf setfiletype terraform
  autocmd BufRead,BufNewFile *.tfstate setfiletype javascript
  autocmd BufRead,BufNewFile *.tfvars setfiletype terraform
  autocmd BufRead,BufNewFile *.yaml.jinja setfiletype yaml.jinja2
  autocmd BufRead,BufNewFile *.vader setfiletype vader
  autocmd BufRead,BufNewFile */example.yaml setfiletype yaml.ansible
  autocmd BufRead,BufNewFile */playbooks/*.yaml setfiletype yaml.ansible
  autocmd BufRead,BufNewFile */site-packages/*.py setfiletype python
  autocmd BufRead,BufNewFile */src/template.html setfiletype svelte
  autocmd BufRead,BufNewFile APKBUILD setfiletype sh.apkbuild
  autocmd BufRead,BufNewFile Jenkinsfile setfiletype groovy
  autocmd BufRead,BufNewFile git-revise-todo setfiletype gitrebase
  autocmd BufRead,BufNewFile hosts setfiletype yaml.ansible.hosts " [1]
  autocmd BufRead,BufNewFile known_hosts setfiletype known_hosts
  autocmd BufRead,BufNewFile secret setfiletype gopass
  autocmd BufRead,BufNewFile done.txt setfiletype todo
  autocmd BufRead,BufNewFile in-basket.txt setfiletype todo
  autocmd BufRead,BufNewFile someday-maybe.txt setfiletype todo
  autocmd BufRead,BufNewFile tickler.txt setfiletype todo
  autocmd BufRead,BufNewFile todo.txt setfiletype todo

  " [1] also need to clear augroup ansible_vim_fthosts see
  " ./after/ftplugin/ansible.vim

" Tests described below

  autocmd BufRead,BufNewFile ~/*.py setfiletype python.black.reorder
  autocmd BufRead,BufNewFile /tmp/man.* setfiletype man

  " `vim ~/example.py`: python.black.reorder
  " `man man`: man

" No tests, may override above with setlocal filetype= see :help :setfiletype
  runtime filetype.gitignored.vim

augroup END
