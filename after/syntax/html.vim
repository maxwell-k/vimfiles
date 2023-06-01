" after/syntax/html.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
"Must be in vim/after/syntax because vim/syntax is read before built in syntax
"rules
syn region htmlDel start="<del\>" end="</del\>" contains=@htmlTop
" Must be manually tweaked to match the font in vimrc
highlight htmlDel cterm=reverse

" used inside markdown documents
syntax keyword htmlTodo contained TODO FIXME
highlight link htmlTodo Todo
syn region htmlComment matchgroup=htmlComment start=+<!--\%(-\?>\)\@!+
  \ end=+--!\?>+ contains=htmlCommentNested,@htmlPreProc,@Spell,htmlTodo
  \ keepend

" don't spell check modelines
" make sure the match group below is defined after htmlComment
" see :help syn-priority - 'the item defined last has priority'
syn match htmlModeline '^<!-- vim[:] set [^:]* : -->$' contains=@NoSpell
highlight link htmlModeline Comment

