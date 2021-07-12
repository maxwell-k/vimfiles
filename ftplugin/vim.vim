" A workaround to avoid an error message that some times appears if editing a
" vim script file. The error is intermittent. It appears to relate to symbolic
" links and absolute paths. For example the command below if ~/.vim is a
" symlink:
"
"     vim ~/.vim/colors/mine.vim
"
if filereadable('/usr/bin/vin')
  let g:ale_vim_vint_executable = '/usr/bin/vint'
else
  let g:ale_vim_vint_executable = '/usr/local/bin/vint'
endif
