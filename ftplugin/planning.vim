augroup ftplugin_planning
    autocmd!
    au BufWritePost <buffer> call planning#commit()
augroup END
