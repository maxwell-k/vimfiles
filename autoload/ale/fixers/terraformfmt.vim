" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Fixing files with terraform fmt
function! ale#fixers#terraformfmt#Fix(buffer) abort
  let l:executable = ale#handlers#terraformfmt#GetExecutable(a:buffer)

  return { 'command': ale#Escape(l:executable) . ' fmt -' }
endfunction
