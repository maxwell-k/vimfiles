" autoload/ale/handlers/zizmor.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0

" See also ftplugin/action.vim
"
" https://github.com/zizmorcore/zizmor/
" blob/v1.16.3/crates/zizmor/src/finding.rs#L59
let s:types = {
\ 'Informational': 'I',
\ 'Low': 'E',
\ 'Medium': 'E',
\ 'High': 'E',
\ }

function! ale#handlers#zizmor#Handle(buffer, lines) abort
    let l:output = []
    let l:json = json_decode(join(a:lines, ''))

    for l:finding in l:json
      let l:suffix = "\n\nSee <" . l:finding.url . '>.'
      for l:location in l:finding.locations
        "   'text': l:location.symbolic.annotation,
        let l:output_line = {
        \   'text': l:finding.desc,
        \   'detail': l:finding.desc . l:suffix,
        \   'lnum': l:location.concrete.location.start_point.row + 1,
        \   'col': l:location.concrete.location.start_point.column,
        \   'end_lnum': l:location.concrete.location.end_point.row + 1,
        \   'end_col': l:location.concrete.location.end_point.column,
        \   'type': s:types[l:finding.determinations.severity],
        \}
      endfor

      call add(l:output, l:output_line)
    endfor

    return l:output
endfunction
