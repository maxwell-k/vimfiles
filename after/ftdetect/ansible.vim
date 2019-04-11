augroup ansible_vim_ftyaml_ansible
  "add extra patterns no need to clear
  autocmd BufNewFile,BufRead */example.yaml set filetype=yaml.ansible
  autocmd BufNewFile,BufRead * if expand("%:p") =~
    \ '\v/(playbooks|write)/.*\.yaml$'
    \ | set filetype=yaml.ansible | end
augroup END
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts set filetype=yaml.ansible.hosts
augroup END
