function! toggle#toggle_jobs() abort "{{{
    if !exists('g:dbext_default_use_jobs')
        let g:dbext_default_use_jobs = 0
    else
        let g:dbext_default_use_jobs = !g:dbext_default_use_jobs
    endif
    let g:dbext_default_use_jobs
endfunction "}}}
function! toggle#toggle_colors() abort "{{{
    if g:colors_name ==# 'mine'
        colorscheme solarized8 | set background=light
    elseif g:colors_name ==# 'solarized8' && &background ==# 'light'
        colorscheme solarized8 | set background=dark
    else
        colorscheme mine
    endif
endfunction "}}}
