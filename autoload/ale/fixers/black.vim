" Changes to sometimes use `uv --offline tool run black`
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" autoload/ale/fixers/black.vim

runtime pack/submodules/start/ale/autoload/ale/fixers/black.vim

" See also after/ale_linters/python/ruff.vim and autoload/python.vim
function! ale#fixers#black#GetExecutable(buffer) abort
    return python#ExecutableOrUv(a:buffer, 'black')
endfunction


function! ale#fixers#black#Fix(buffer) abort
    let l:executable = ale#fixers#black#GetExecutable(a:buffer)
    let l:cmd = [ale#Escape(l:executable)]

    if l:executable =~? 'uv$'
        call extend(l:cmd, ['--offline', 'tool', 'run', 'black'])
    endif

    let l:options = ale#Var(a:buffer, 'python_black_options')

    if !empty(l:options)
        call add(l:cmd, l:options)
    endif

    let l:fname = expand('#' . a:buffer . '...')
    call add(l:cmd, '--stdin-filename '.ale#Escape(ale#path#Simplify(l:fname)))

    " typing stubs
    if expand('#' . a:buffer . ':e') is? 'pyi'
        call add(l:cmd, '--pyi')
    endif

    call add(l:cmd, '-')

    let l:result = {'command': join(l:cmd, ' ')}

    if ale#Var(a:buffer, 'python_black_change_directory')
        let l:result.cwd = '%s:h'
    endif

    return l:result
endfunction
