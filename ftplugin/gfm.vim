" The GFM spec [1] explains that:
"
" > A conforming parser may render a soft line break in HTML either as a line
" > break or as a space.
"
" Using this filetype as markdown.gfm makes sure that markdown displays as
" expected.
"
" :set filetype=markdown.gfm
"
" [1] https://github.github.com/gfm/#soft-line-breaks
let b:ale_javascript_prettier_options = '--prose-wrap never --parser markdown'
