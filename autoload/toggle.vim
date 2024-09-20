" autoload/toggle.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! toggle#colors() abort "{{{1
  let s:style = get(g:, 'ayucolor', 'dark')
  if !exists('g:colors_name') " added for compatibility with vim 8.0
    let g:ayucolor='dark'
    colorscheme mine
  elseif s:style ==# 'light'
    let g:ayucolor='dark'
    colorscheme mine
  elseif s:style ==# 'dark'
    let g:ayucolor='mirage'
    colorscheme mine
  else
    let g:ayucolor='light'
    colorscheme mine
  endif
  redraw
  echom 'let '
     \."g:colors_name = '"
     \.g:colors_name
     \."' | let "
     \."g:ayucolor = '"
     \.g:ayucolor
     \."'"
endfunction "}}}1
function! toggle#list(default_settings) abort "{{{1
" Toggle through three states
  if !&list
    silent setlocal list listchars&vim showbreak&vim
  elseif &listchars==#'eol:$'
    silent execute a:default_settings
  else
    silent setlocal nolist listchars&vim showbreak&vim
  end
  redraw
endfunction "}}}1
function! toggle#ale() abort "{{{1
  if !exists('g:ale_fix_on_save')
    let g:ale_fix_on_save = 1
    ALEEnable
  elseif g:ale_fix_on_save ==# 1
    let g:ale_fix_on_save = 0
    ALEDisable
  else " g:ale_fix_on_save ==# 0
    let g:ale_fix_on_save = 1
    ALEEnable
  endif
  let g:ale_fix_on_save
endfunction "}}}1
function! toggle#shiftwidth() abort "{{{1
  if &shiftwidth == 2
    setlocal shiftwidth=3
    setlocal softtabstop=3
  else
    setlocal shiftwidth=2
    setlocal softtabstop=2
  end
  setlocal shiftwidth
endfunction "}}}1
function! toggle#python() abort "{{{1
  if &filetype ==# 'python'
    setlocal filetype=python.black
  elseif &filetype ==# 'python.black'
    setlocal filetype=python.black.usort
  else
    setlocal filetype=python
  end
  setlocal filetype
endfunction "}}}1
function! toggle#python_linters(...) abort "{{{1
  if get(b:, 'ale_linters_ignore', []) == ['mypy']
    let b:ale_linters_ignore = []
  else
    let b:ale_linters_ignore = ['mypy']
  end
  if a:0 > 0
    let b:ale_linters_ignore = ['mypy']
  end
  redraw | echom 'let b:ale_linters_ignore = '.string(b:ale_linters_ignore)
endfunction "}}}1
function! toggle#todo_fold() abort "{{{1
  if !exists('g:Todo_fold_char')
    let g:Todo_fold_char = '+'
  elseif g:Todo_fold_char ==# ''
    let g:Todo_fold_char = '+'
  elseif g:Todo_fold_char ==# '+'
    let g:Todo_fold_char = '@'
  else
    let g:Todo_fold_char = ''
  end
  edit
  setlocal foldlevel=0
  echom g:Todo_fold_char
endfunction "}}}1
" vim: set foldmethod=marker foldlevel=0 :
