" Author: Keith Maxwell <keith.maxwell@gmail.com
" Description: Formatting files with bean-format, part of beeancount
function! ale#fixers#beanformat#Fix(buffer) abort
  let l:executable = ale#handlers#beanformat#GetExecutable(a:buffer)

  return { 'command': ale#Escape(l:executable) . ' -' }
endfunction
