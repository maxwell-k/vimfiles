let s:repository = fnamemodify(resolve(expand('<sfile>')),':p:h')
function! vim#cipher() abort "{{{1
  let s:file = s:repository.'/../../../safe/cipher.bf'
  if filereadable(s:file) | execute 'edit '.resolve(s:file)
  else | find safe/cipher.bf
  endif
endfunction
" }}}
function! vim#scriptnames() abort "{{{1
  "Open the output of :scriptnames for searching
  let l:file=tempname()
  let l:more_saved=&more
  set nomore
  execute 'redir > '.l:file
  silent scriptnames
  redir END
  let &more=l:more_saved
  execute 'new '.l:file
  normal! OOutput from ``:scriptnames``:
  setlocal buftype=nofile bufhidden=hide noswapfile
endfunction "}}}
function! vim#sum() range abort "{{{1
"Assumes 'selection' is blockwise and inclusive
python3 <<EOS
import vim
import decimal
top, left       = vim.eval("getpos(\"'<\")[1:2]")
bottom, right   = vim.eval("getpos(\"'>\")[1:2]")
top, left, bottom, right = int(top), int(left), int(bottom), int(right)
numbers = [i[left - 1:right] for i in vim.current.buffer[top - 1:bottom]]
numbers = [i.replace(',','').rstrip('\xc2\xa3 ') for i in numbers]
result = '{:,}'.format(sum(decimal.Decimal(i) for i in numbers if i))
print(result)
EOS
let @= = "'".py3eval('result')."'"
endfunction "}}}1
function! vim#toggleListMode(default_settings) abort "{{{1
" Toggle through three states, ``:help digraph-table`` lists symbols
  if !&list
    set list listchars&vim showbreak&vim
  elseif &listchars==#'eol:$'
    execute a:default_settings
  else
    set nolist listchars&vim showbreak&vim
  end
endfunction "}}}1
