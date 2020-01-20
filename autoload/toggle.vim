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
    silent set list listchars&vim showbreak&vim
  elseif &listchars==#'eol:$'
    silent execute a:default_settings
  else
    silent set nolist listchars&vim showbreak&vim
  end
endfunction "}}}1
" vim: set foldmethod=marker foldlevel=0 :
