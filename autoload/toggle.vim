function! toggle#toggle_colors() abort
    if !exists('g:colors_name') " added for compatibility with vim 8.0
        colorscheme mine
    elseif g:colors_name ==# 'mine'
        colorscheme solarized8 | set background=light
    elseif g:colors_name ==# 'solarized8' && &background ==# 'light'
        colorscheme solarized8 | set background=dark
    else
        colorscheme mine
    endif
endfunction
