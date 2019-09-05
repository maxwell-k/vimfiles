augroup ftplugin_automatic
    autocmd!
    autocmd BufWritePost <buffer> call automatic#commit()
augroup END
