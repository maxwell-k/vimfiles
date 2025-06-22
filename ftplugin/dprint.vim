" ftplugin/dprint.vim
" Copyright 2023 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let s:fixers_to_replace = ['prettier', 'jq']
let b:ale_fixers = {}
for [s:key, s:entry] in items(deepcopy(get(g:, 'ale_fixers', {})))
  let b:ale_fixers[s:key] = s:entry
  for s:before in s:fixers_to_replace
    let s:index =  index(s:entry, s:before)
    if s:index != -1
      let s:entry[s:index] = 'dprint'
    endif
  endfor
endfor
