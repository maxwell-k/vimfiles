augroup ftplugin_planning
    autocmd!
    autocmd BufWritePost <buffer> call planning#commit()
augroup END
