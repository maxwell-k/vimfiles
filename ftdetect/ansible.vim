augroup ansible_vim_ftyaml_ansible
  "add two directories no need to clear
  au BufNewFile,BufRead * if expand("%:p") =~
    \ '\v/(playbooks|write)/.*\.yaml$'
    \ | set filetype=yaml.ansible | end
augroup END
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END
