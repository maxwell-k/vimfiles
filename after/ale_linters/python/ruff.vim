" Changes to sometimes use `uv --offline tool run ruff`
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" after/ale_linters/python/ruff.vim
" See also pack/submodules/start/ale/ale_linters/python/ruff.vim

function! ale_linters#python#ruff#GetExecutable(buffer) abort
    return python#ExecutableOrUv(a:buffer, 'ruff') " See autoload/python.vim
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
