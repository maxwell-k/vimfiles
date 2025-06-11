" Changes to use `uv --offline tool run ruff`
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" after/ale_linters/python/ruff.vim
" See also pack/submodules/start/ale/ale_linters/python/ruff.vim

" These changes mean that ruff will be run:
" 1. From a virtual environment or
" 2. via $PATH or
" 3. via `uv tool run`.

function! ale_linters#python#ruff#GetExecutable(buffer) abort

    " See also:
    " pack/submodules/start/ale/ale_linters/python/ruff.vim
    " pack/submodules/start/ale/autoload/ale/python.vim
    let l:result = ale#python#FindExecutable(a:buffer, 'python_ruff', ['ruff'])

    if l:result ==# 'ruff' && !executable('ruff')
        let l:result = 'uv'
    endif

    return l:result
endfunction

function! ale_linters#python#ruff#GetCommand(buffer, version) abort
    let l:executable = ale_linters#python#ruff#GetExecutable(a:buffer)
    let l:exec_args = l:executable =~? 'uv$' ? ' --offline tool run ruff' : ''

    let l:exec_args .= ' check'

    return ale#Escape(l:executable) . l:exec_args . ' -q'
    \   . ' --no-fix'
    \   . ale#Pad(ale#Var(a:buffer, 'python_ruff_options'))
    \   . ' --output-format json-lines'
    \   . ' --stdin-filename %s -'
endfunction
