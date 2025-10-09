" pack/vendored/start/automatic/ftplugin/automatic.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
augroup ftplugin_automatic
    autocmd!
    autocmd BufWritePost <buffer> call automatic#commit()
augroup END
