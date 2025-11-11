" autoload/fzf.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! fzf#CustomGitStatus() abort
  " manually tested only
  " neither vader nor runVimTests can pass keys to FZF
  let l:spec = {}
  let l:spec['options'] = '--ansi --nth 2..'
  let l:spec['source'] =
    \ 'git -c color.status=always status --short'.' --untracked-files=all'
  let l:spec = fzf#wrap(l:spec)
  let l:spec['_original_sink'] = remove(l:spec, 'sink*')
  function! l:spec.temporary_name(input) abort
    let l:key =  a:input[0:0] " ctrl-t ctrl-v ctrl-x etc.
    let l:rest = map(a:input[1:], 'v:val[3:]')
    let l:rest = map(l:rest, 'substitute(v:val, ".* -> ", "", "")')
    return self['_original_sink'](extend(l:key, l:rest))
  endfunction
  let l:spec['sink*'] = remove(l:spec, 'temporary_name')
  call fzf#run(l:spec)
endfunction
