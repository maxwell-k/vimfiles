" autoload/toggle.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
function! toggle#toggle_colors() abort "{{{1
  if !exists('g:colors_name') " added for compatibility with vim 8.0
    colorscheme mine
  elseif g:colors_name ==# 'mine'
    colorscheme solarized8 | set background=light
  elseif g:colors_name ==# 'solarized8' && &background ==# 'light'
    colorscheme solarized8 | set background=dark
  else
    colorscheme mine
  endif
endfunction "}}}1
function! toggle#toggle_list(default_settings) abort "{{{1
" Toggle through three states, ``:help digraph-table`` lists symbols
  if !&list
    silent setlocal list listchars&vim showbreak&vim
  elseif &listchars==#'eol:$'
    silent execute a:default_settings
  else
    silent setlocal nolist listchars&vim showbreak&vim
  end
  redraw
endfunction "}}}1
function! toggle#toggle_ale() abort "{{{1
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
function! toggle#toggle_shiftwidth() abort "{{{1
  if &shiftwidth == 2
    setlocal shiftwidth=3
    setlocal softtabstop=3
  else
    setlocal shiftwidth=2
    setlocal softtabstop=2
  end
  setlocal shiftwidth
endfunction "}}}1
function! toggle#toggle_python() abort "{{{1
  if &filetype ==# 'python'
    setlocal filetype=python.black
  elseif &filetype ==# 'python.black'
    setlocal filetype=python.black.reorder
  else
    setlocal filetype=python
  end
  setlocal filetype
endfunction "}}}1
function! toggle#toggle_python_linters(...) abort "{{{1
  if get(b:, 'ale_linters', []) == ['flake8', 'pyright']
    let b:ale_linters = ['flake8', 'pyright', 'mypy']
  elseif get(b:, 'ale_linters', []) == ['flake8', 'pyright', 'mypy']
    let b:ale_linters = ['flake8']
  else
    let b:ale_linters = ['flake8', 'pyright']
  end
  if a:0 > 0
    let b:ale_linters = ['flake8', 'pyright']
  end
  redraw | echom 'let b:ale_linters = '.string(b:ale_linters)
endfunction "}}}1
" vim: set foldmethod=marker foldlevel=0 :
