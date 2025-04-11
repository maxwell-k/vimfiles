" after/syntax/todo.vim
" Copyright 2025 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
" Custom syntax rules {{{1
" Avoid key:value syntax clashing with links like https://... {{{2
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
syntax match TodoURL = https\?://\S*=ms=s+1 containedin=ALL
  \ contains=@NoSpell
syntax match TodoURL =[<(]\?https\?://\S*[>)]=hs=s+1,he=e-1 containedin=ALL
  \ contains=@NoSpell
syntax clear TodoKey
" The original pattern was: '\S*\S:\S\S*'
syntax match TodoKey '[^ \t`]\+:[^ \t/]\+'
syntax match TodoDue '\Cdue:[^ \t/]\+'
  \ containedin=ALLBUT,TodoDone,TodoCancel
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
" Use different group names, with an After suffix, to avoid confusion
" contains= in definitions like TodoPriorityZ
" Handle start dates similarly to due dates {{{2
execute 'syntax match TodoOverDueDateAfter /'
  \ . todo#GetDateRegexForPastDates() . '/ contained containedin=TodoDue'
execute 'syntax match TodoOverStartDate /'
  \ . todo#GetDateRegexForPastDates() . '>/ contained containedin=TodoStart'
execute 'syntax match TodoDueTodayAfter /' . strftime('%Y\-%m\-%d')
  \ . '/ contained containedin=TodoDue'
execute 'syntax match TodoStartToday /' . strftime('%Y\-%m\-%d')
  \ . '/ contained containedin=TodoStart'
highlight default ToDoOverDueDateAfter cterm=bold
highlight default TodoOverDueDateAfter cterm=bold
highlight default link TodoStartToday TodoDueTodayAfter

syntax match TodoStart '\Cstart:[^ \t/]\+'
  \ containedin=ALLBUT,TodoDone,TodoCancel
highlight default link TodoStart Special

" Do not check spelling or highlight dates in done items {{{2
syntax clear TodoDone
syntax match TodoDone /^[x]\s.\+$/
  \ contains=@NoSpell,TodoCancel

" Strike through cancelled items {{{2
syntax region TodoCancel start=/\~\~/ end=/\~\~/ contains=@NoSpell
highlight default TodoCancel cterm=strikethrough

" Markers for recurring tasks like rec:1d {{{2
syntax match TodoRec 'rec:[^ \t/]\S*' containedin=ALLBUT,TodoCode
  \ contains=@NoSpell

" Do not spell check email address like: <mail@example.org> {{{2
syntax match TodoEmail =<[^>]\+@[^>]\+>=hs=s+1,he=e-1 containedin=ALL
  \ contains=@NoSpell

" Do not spell check code fragments like `ls directory/` {{{2
syntax match TodoCode =`[^`]\+`=
  \ containedin=ALLBUT,TodoCode,TodoCancel,TodoDone
  \ contains=@NoSpell

" Highlight finished today and yesterday {{{2
execute 'syntax match TodoDoneToday / ' .
  \strftime('%Y\-%m\-%d')
  \. ' / contained containedin=TodoDone'
execute 'syntax match TodoDoneYesterday / ' .
  \strftime('%Y\-%m\-%d', localtime()- 24*60*60)
  \. ' / contained containedin=TodoDone'
highlight default TodoDoneToday cterm=bold

" Projects are all lowercase and not spell checked {{{2
syntax clear TodoProject
syntax match TodoProject /+[a-z0-9\-]\+\C/ contains=@NoSpell

" Folding marker {{{2
syntax match TodoFoldMarker /^{{{$/
highlight default link TodoFoldMarker Comment

" Bespoke formatting {{{1
" hex codes from pack/submodules/start/ayu/colors/ayu.vim
highlight clear TodoDate
highlight link TodoDate NONE
highlight TodoDate cterm=italic

highlight clear TodoCode

highlight TodoPriorityA cterm=bold
highlight link ToDoPriorityB NONE
highlight link ToDoPriorityC NONE

highlight link TodoEmail NONE
highlight TodoEmail cterm=underline

highlight link TodoURL NONE
highlight TodoURL cterm=underline

highlight link TodoKey SpellRare

highlight TodoProject guifg=NONE cterm=bold

highlight TodoCancel guifg=#5C6773

highlight link TodoRec Comment " recurring tasks e.g. rec:1d

highlight link TodoContext NONE
highlight TodoContext guifg=#95E6CB

" Dates {{{2
highlight ToDoOverDueDateAfter cterm=bold guifg=#F07178
highlight TodoDoneToday guifg=SeaGreen cterm=bold
highlight TodoDoneYesterday guifg=SeaGreen
highlight TodoDueTodayAfter guifg=lightgreen
highlight TodoOverStartDate guifg=#F07178

" vim: set foldmethod=marker foldlevel=0 : {{{1
