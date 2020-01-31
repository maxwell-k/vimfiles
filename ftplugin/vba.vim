scriptencoding utf-8
highlight clear Folded
highlight link Folded Comment
setlocal fillchars+=fold:…
setlocal foldmethod=syntax
setlocal foldtext=vba#foldtext()
setlocal spell
let b:ale_linter_aliases = {'vba': 'vim'}
let b:ale_linters = ['sed']
