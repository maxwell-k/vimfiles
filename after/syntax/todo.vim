" after/syntax/todo.vim
" Copyright 2022 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" Avoid key:value syntax clashing with links like https://... {{{1
"
" The original syntax pattern for this syntax matches markdown link syntax
" like the example below:
"
"   [example link](https://example.org)
"
" Adding a restiction that value cannot start with / means that markdown links
" are not highlighted as key:value pairs.
"
" Starting with [^ \t`] means that TodoCode in syntax/todo.vim starts first
" and `a:b` is recognised as TodoCode.
"
" https://github.com/todotxt/todo.txt#additional-file-format-definitions
"
" According to :help \S, \S is equivalent to [^ \t]
"
" See also:
" ./syntax/todo.vim
" ./tests/manual/todo.txt
" ./pack/submodules/opt/todo.txt/syntax/todo.vim
"
syntax match TodoURL =[(<]\?https\?://\S*[)>]\?= containedin=ALL
  \ contains=@NoSpell
syntax clear TodoKey
" The original pattern was: '\S*\S:\S\S*'
syntax match TodoKey '[^ \t`]\+:[^ \t/]\S*' contains=TodoDate
syntax match TodoDue '\Cdue:[^ \t/]\S*' contains=TodoDate containedin=
  \TodoPriorityA,TodoPriorityB,TodoPriorityC,TodoPriorityD,TodoPriorityE,
  \TodoPriorityF,TodoPriorityG,TodoPriorityH,TodoPriorityI,TodoPriorityJ,
  \TodoPriorityK,TodoPriorityL,TodoPriorityM,TodoPriorityN,TodoPriorityO,
  \TodoPriorityP,TodoPriorityQ,TodoPriorityR,TodoPriorityS,TodoPriorityT,
  \TodoPriorityU,TodoPriorityV,TodoPriorityW,TodoPriorityX,TodoPriorityY,
  \TodoPriorityZ
highlight default link TodoDue Special
" These changes ruin some of the date highlighting functionality, for example
" the due dates on the three lines below should be highlighted differently:
"
" 2022-10-10 due:2022-10-09 Due yesterday [example link](https://example.org)
" 2022-10-10 due:2022-10-10 Due today [example link](https://example.org)
" 2022-10-10 due:2023-01-01 Due tomorrow [example link](https://example.org)
"
" The commands below restore this functionality:
syntax clear TodoDueToday TodoOverDueDate
execute 'syntax match TodoOverDueDate /\C\v<due:'
  \ . todo#GetDateRegexForPastDates() . '>/'
execute 'syntax match TodoDueToday /\C\v<due:' . strftime('%Y\-%m\-%d')
  \ . '>/ contains=NONE'

" Handle start dates similarly to due dates {{{1
syntax match TodoStart '\Cstart:[^ \t/]\S*' contains=TodoDate containedin=
  \TodoPriorityA,TodoPriorityB,TodoPriorityC,TodoPriorityD,TodoPriorityE,
  \TodoPriorityF,TodoPriorityG,TodoPriorityH,TodoPriorityI,TodoPriorityJ,
  \TodoPriorityK,TodoPriorityL,TodoPriorityM,TodoPriorityN,TodoPriorityO,
  \TodoPriorityP,TodoPriorityQ,TodoPriorityR,TodoPriorityS,TodoPriorityT,
  \TodoPriorityU,TodoPriorityV,TodoPriorityW,TodoPriorityX,TodoPriorityY,
  \TodoPriorityZ
highlight default link TodoDue Special
highlight default link TodoStart Special
execute 'syntax match TodoOverStartDate /\C\v<start:'
  \ . todo#GetDateRegexForPastDates() . '>/ contains=NONE containedin=ALL'
highlight default link TodoOverStartDate TodoOverDueDate
execute 'syntax match TodoStartToday /\C\v<start:' . strftime('%Y\-%m\-%d')
  \ . '>/ contains=NONE containedin=ALL'
highlight default link TodoStartToday Todo

" Do not check spelling or highlight dates in done items {{{1
syntax clear TodoDone
syntax match TodoDone /^[x]\s.\+$/
  \ contains=@NoSpell,TodoProject,TodoContext,TodoCancel

" Strike through cancelled items {{{1
syntax region TodoCancel start=/\~\~/ end=/\~\~/ contains=@NoSpell
highlight default TodoCancel cterm=strikethrough guifg=#5C6773

" Highlight markers for recurring tasks like rec:1d {{{1
syntax match TodoRec 'rec:[^ \t/]\S*' containedin=ALL contains=@NoSpell
highlight default link TodoRec Special

" Do not spell check email address like: <mail@example.org> {{{1
syntax match TodoEmail =<[^>]\+@[^>]\+>= containedin=ALL contains=@NoSpell

" Do not spell check code fragments like `ls directory/` {{{1
syntax match TodoCode =`[^`]*`= containedin=ALL contains=@NoSpell

" Highlight finished today and yesterday {{{1
execute 'syntax match TodoDoneToday / ' .
  \strftime('%Y\-%m\-%d') . ' / containedin=TodoDone'
highlight default TodoDoneToday guifg=SeaGreen cterm=bold
execute 'syntax match TodoDoneYesterday / ' .
  \strftime('%Y\-%m\-%d', localtime()- 24*60*60) . ' / containedin=TodoDone'
highlight default TodoDoneYesterday guifg=SeaGreen

" Projects are all lowercase and not spell checked {{{1
syntax clear TodoProject
syntax match TodoProject /+[a-z0-9\-]\+\C/ contains=@NoSpell
" Folding marker {{{1
syntax match TodoFoldMarker /^{{{$/
highlight default link TodoFoldMarker Comment
" vim: set foldmethod=marker foldlevel=0 : {{{1
