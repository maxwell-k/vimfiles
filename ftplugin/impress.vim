" The impress progress bar relies on an empty div inside #impress-progressbar
" [tidy](https://www.w3.org/People/Raggett/tidy/) highlights this as an error
" the solution is to disable tidy
let b:ale_linters_ignore = ['tidy']
let b:match_ignorecase = 1
let b:match_words = '<:>,' .
\ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
\ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
\ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
runtime macros/matchit.vim
