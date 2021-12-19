" tests/automated/transform/run.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
function s:Error(a, b)
    execute 'silent !echo "Failed because \"'
      \ . a:a
      \ . '\" is not \"'
      \ . a:b
      \ . '\""'
endfunction
function s:Check(input, expected)
  let l:result = opfunc#transform(a:input)
  if  l:result !=# a:expected
    call s:Error(l:result, a:expected)
    cq
  endif
endfunction
call s:Check('0', '0')
call s:Check('  2', '2')
call s:Check("  3 \\\n  4", '3 4')
call s:Check("5 ^\n6", '5 6')
call s:Check('7  8', '7 8')
call s:Check("# 9\n# 10", '9 10')
call s:Check("11\n12", '11 12')
call s:Check("13\n14 ", '13 14')
call s:Check("15\n\\ 16", '15 16')
call s:Check("  17\n    \\ 18", '17 18')
call s:Check('19	20', '19 20')
let s:result = opfunc#dedent('  1')
let s:expected = '1'
if  s:result !=# s:expected
  call s:Error(s:result, s:expected)
  cq
endif
quit
