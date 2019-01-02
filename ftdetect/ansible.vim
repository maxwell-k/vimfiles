" based upon ftdetect/ansible.vim from
" https://github.com/pearofducks/ansible-vim
" vint: -ProhibitAutocmdWithNoGroup
au BufNewFile,BufRead * if expand("%:p") =~
  \ '\v/(playbooks|tasks|roles|write)/.*\.yaml$'
  \ | set filetype=yaml.ansible | end
au BufNewFile,BufRead hosts setfiletype yaml.ansible
au BufNewFile,BufRead **/configuration/*.yaml set filetype=yaml.ansible
au BufNewFile,BufRead site.yml,site.yaml set filetype=yaml.ansible
