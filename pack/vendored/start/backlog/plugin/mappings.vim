":sort
nnoremap <Plug>(backlog_sort_context) :call backlog#Sort("@")<Return>
nnoremap <Plug>(backlog_sort_project) :call backlog#Sort("+")<Return>

":sort
nnoremap <unique> <Leader>t@ <Plug>(backlog_sort_context)
nnoremap <unique> <Leader>tp <Plug>(backlog_sort_project)
" pack/vendored/start/backlog/plugin/mappings.vim
" Copyright Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
