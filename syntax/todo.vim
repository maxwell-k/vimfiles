" syntax/todo.vim
" Copyright 2021 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
packadd todo.txt
runtime OPT syntax/todo.vim
syntax match TodoURL =[(<]\?https\?://\S*[)>]\?= containedin=TodoDone,
  \TodoPriorityA,TodoPriorityB,TodoPriorityC,TodoPriorityD,TodoPriorityE,
  \TodoPriorityF,TodoPriorityG,TodoPriorityH,TodoPriorityI,TodoPriorityJ,
  \TodoPriorityK,TodoPriorityL,TodoPriorityM,TodoPriorityN,TodoPriorityO,
  \TodoPriorityP,TodoPriorityQ,TodoPriorityR,TodoPriorityS,TodoPriorityT,
  \TodoPriorityU,TodoPriorityV,TodoPriorityW,TodoPriorityX,TodoPriorityY,
  \TodoPriorityZ contains=@NoSpell
syntax region TodoCancel start=/\~\~/ end=/\~\~/
syntax match TodoCode =`[^`]*`= containedin=TodoDone,
  \TodoPriorityA,TodoPriorityB,TodoPriorityC,TodoPriorityD,TodoPriorityE,
  \TodoPriorityF,TodoPriorityG,TodoPriorityH,TodoPriorityI,TodoPriorityJ,
  \TodoPriorityK,TodoPriorityL,TodoPriorityM,TodoPriorityN,TodoPriorityO,
  \TodoPriorityP,TodoPriorityQ,TodoPriorityR,TodoPriorityS,TodoPriorityT,
  \TodoPriorityU,TodoPriorityV,TodoPriorityW,TodoPriorityX,TodoPriorityY,
  \TodoPriorityZ contains=@NoSpell

syntax match TodoEmail =<[^>]\+@[^>]\+>= containedin=TodoDone,
  \TodoPriorityA,TodoPriorityB,TodoPriorityC,TodoPriorityD,TodoPriorityE,
  \TodoPriorityF,TodoPriorityG,TodoPriorityH,TodoPriorityI,TodoPriorityJ,
  \TodoPriorityK,TodoPriorityL,TodoPriorityM,TodoPriorityN,TodoPriorityO,
  \TodoPriorityP,TodoPriorityQ,TodoPriorityR,TodoPriorityS,TodoPriorityT,
  \TodoPriorityU,TodoPriorityV,TodoPriorityW,TodoPriorityX,TodoPriorityY,
  \TodoPriorityZ contains=@NoSpell
