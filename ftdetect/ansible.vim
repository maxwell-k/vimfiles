augroup ansible_vim_ftyaml_ansible
  "add extra patterns no need to clear
  au BufNewFile,BufRead */example.yaml set filetype=yaml.ansible
  au BufNewFile,BufRead * if expand("%:p") =~
    \ '\v/(playbooks|write)/.*\.yaml$'
    \ | set filetype=yaml.ansible | end
augroup END
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts set filetype yaml.ansible
augroup END
