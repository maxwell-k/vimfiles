" autoload/opfunc.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! opfunc#All() abort "{{{
    " map everything from this file
    " yank below means yank to system clipboard
    call opfunc#opfuncmap('c') " straight yank
    call opfunc#opfuncmap('C') " dedent then yank
    "call opfunc#opfuncmap('j', 'jupyter') " run in jupyter
    call opfunc#opfuncmap('l') " run in dbext
    call opfunc#opfuncmap('L') " run in dbext with .mode list
    call opfunc#opfuncmap('y') " transform then yank
endfunction "}}}
function! opfunc#opfuncInput(type, count) abort " {{{
    if a:type ==# 'line'  " used with opfunc
        silent exe "normal! '[V']y"
    elseif  a:type ==# 'char' || a:type ==# 'block'
        silent exe 'normal! `[v`]y'
    elseif a:count  " invoked from Visual mode, use gv command.
        silent exe 'normal! gvy'
    elseif a:type =~# '^\d\+$'  " adapted from unimpaired.vim
        let l:save_cursor = getcurpos()
        silent exe 'norm! 0v'.a:type.'$hy'
        call setpos('.', l:save_cursor)
    endif
endfunction "}}}
function! opfunc#restore() abort "{{{ move back to the saved cursor position
    call setpos('.', s:save_cursor)
endfunction
function! opfunc#save() abort "{{ save the cursor position
    let s:save_cursor = getcurpos()
endfunction "}}}
function! opfunc#opfuncmap(key, ...) abort "{{{ map an opfunc
    let l:filename = a:0 ? a:1 : 'opfunc'
    let l:common = 'map <silent> <Leader>'.a:key
    execute 'n'.l:common.' :call opfunc#save()\|set opfunc='
        \ .l:filename.'#'.a:key.'<CR>g@'
    execute 'v'.l:common.' :<C-U>call '.l:filename.'#'.a:key
        \ .'(visualmode(), 1)<CR>'
    execute 'n'.l:common.a:key.' :<C-U>call '.l:filename.'#'.a:key
        \ .'(v:count1)<CR>'
endfunction "}}}
function! opfunc#clipboard(value) abort " copy to clipboard {{{
    if has('clipboard')
        let @+ = a:value
    elseif exists('*SendViaOSC52')
        call SendViaOSC52(a:value)
    else
        echom 'Not supported'
    endif
endfunction "}}}
function! opfunc#dedent(text) abort " {{{ Dedent string
" Based upon vim-misc by Peter Odding
" https://github.com/xolox/vim-misc/blob/master/autoload/xolox/misc/str.vim
  " Remove common whitespace from a multi line string.
  let l:lines = split(a:text, "\n")
  " First we need to determine the common indentation of all non-empty lines.
  for l:line in l:lines
    if l:line =~? '\S'
      let l:indent = matchstr(l:line, '^\s*')
      if !exists('l:common_indent')
        let l:common_indent = l:indent
      elseif len(l:indent) < len(l:common_indent)
        let l:common_indent = l:indent
      endif
    endif
  endfor
  " Now we will strip the common indentation.
  let [l:idx, l:limit] = [0, len(l:lines)]
  while l:idx < l:limit
    let l:lines[l:idx] = substitute(
        \ l:lines[l:idx], '^'.l:common_indent, '', '')
    let l:idx += 1
  endwhile
  return join(l:lines, "\n")
endfunction " }}}
function! opfunc#transform(input) abort "{{{ Tranform string
  let l:s = opfunc#dedent(a:input)
  let l:s = substitute(l:s, '\\\n', '\n', 'g') " \ at the EOL e.g. bash
  let l:s = substitute(l:s, '\^\n', '\n', 'g') " ^ at EOL e.g. batch script
  let l:s = substitute(l:s, '\(^\|\n\)#', '\1', 'g') " uncomment if '#'
  let l:s = substitute(l:s, '\(^\|\n\) *\\', '\1', 'g') " vim line continuation
  let l:s = substitute(l:s, '\n', ' ', 'g') " replace newlines with spaces
  let l:s = substitute(l:s, '\t', ' ', 'g') " replace tabs with spaces
  let l:s = substitute(l:s, ' \+', ' ', 'g') " multiple to single spaces
  let l:s = substitute(l:s, '^ ', '', '') " remove leading space
  let l:s = substitute(l:s, ' $', '', '') " remove trailing space
  return l:s
endfunction "}}}
function! opfunc#c(type, ...) abort " Straight yank {{{
    let l:sel_save=&selection | let &selection='inclusive' |let l:reg_save=@@

    call opfunc#opfuncInput(a:type, a:0)
    call opfunc#clipboard(@@)

    let &selection = l:sel_save | let @@ = l:reg_save
    if a:type ==# 'line' | call opfunc#restore() | endif
endfunction " }}}
function! opfunc#C(type, ...) abort " Dedent then yank {{{
    let l:sel_save=&selection | let &selection='inclusive' |let l:reg_save=@@

    call opfunc#opfuncInput(a:type, a:0)
    let @@ = opfunc#dedent(@@)
    call opfunc#clipboard(@@)

    let &selection = l:sel_save | let @@ = l:reg_save
    if a:type ==# 'line' | call opfunc#restore() | endif
endfunction " }}}
function! opfunc#l(type, ...) abort " run in dbext {{{
    let l:sel_save=&selection | let &selection='inclusive' |let l:reg_save=@@

    call opfunc#opfuncInput(a:type, a:0)
    let @@ = opfunc#dedent(@@)
    call dbext#DB_execSql(@@)

    let &selection = l:sel_save | let @@ = l:reg_save
    if a:type ==# 'line' | call opfunc#restore() | endif
endfunction " }}}
function! opfunc#L(type, ...) abort " run in dbext .header off & .mode list {{{
    let l:sel_save=&selection | let &selection='inclusive' |let l:reg_save=@@

    call opfunc#opfuncInput(a:type, a:0)
    let @@ = opfunc#dedent(@@)
    let @@ = ".header off\n.mode list\n".@@
    call dbext#DB_execSql(@@)

    let &selection = l:sel_save | let @@ = l:reg_save
    if a:type ==# 'line' | call opfunc#restore() | endif
endfunction " }}}
function! opfunc#y(type, ...) abort " transform then yank {{{
    let l:sel_save=&selection | let &selection='inclusive' |let l:reg_save=@@

    call opfunc#opfuncInput(a:type, a:0)
    call opfunc#clipboard(opfunc#transform(@@))
    let &selection = l:sel_save | let @@ = l:reg_save
    if a:type ==# 'line' | call opfunc#restore() | endif
endfunction
"}}}
" vim: set foldmethod=marker foldlevel=0 :
