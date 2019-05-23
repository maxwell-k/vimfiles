" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: terraform fmt to check for errors

function! ale_linters#terraform#terraformfmt#GetCommand(buffer) abort
  return ale#Escape(ale#handlers#terraformfmt#GetExecutable(a:buffer))
  \ . ' fmt -no-color --check=true -'
endfunction

function! ale_linters#terraform#terraformfmt#Handle(buffer, lines) abort
  let l:head = '^Error running fmt: In <standard input>: '
  let l:output = []
  let l:patterns = [
    \ l:head.'At \(\d\+\):\(\d\+\): \(.*\)$',
    \ l:head.'\(.*\)$'
    \]
  for l:match in ale#util#GetMatches(a:lines, l:patterns)
    " echom join(l:match, '|')
    if len(l:match[2]) > 0
      call add(l:output, {
      \ 'lnum': l:match[1],
      \ 'col': l:match[2],
      \ 'text': l:match[3],
      \ 'type': 'E',
      \ })
    else
      call add(l:output, {
      \ 'lnum': line('$'),
      \ 'text': l:match[1],
      \ 'type': 'E',
      \ })
    endif
  endfor
  return l:output
endfunction

call ale#linter#Define('terraform', {
\ 'name': 'terraformfmt',
\ 'output_stream': 'stderr',
\ 'executable': function('ale#handlers#terraformfmt#GetExecutable'),
\ 'command': function('ale_linters#terraform#terraformfmt#GetCommand'),
\ 'callback': 'ale_linters#terraform#terraformfmt#Handle',
\})
