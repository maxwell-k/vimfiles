" See `:help setfiletype`, `setfiletype text` is called on *.txt
" vint: -ProhibitAutocmdWithNoGroup
au! BufRead,BufNewFile */planning/*.txt setlocal filetype=rst.planning
