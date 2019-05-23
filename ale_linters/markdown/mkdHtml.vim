scriptencoding utf-8
call ale#linter#Define(fnamemodify(expand('<sfile>:p:h'), ':t'), {
\   'name': 'mkdHtml',
\   'executable': 'sed',
\   'command': function('mkdHtml#GetCommand'),
\   'callback': 'mkdHtml#Handle',
\   'output_stream': 'stdout',
\})
" Using html fenced code blocks in markdown has two unwanted side effects:

" 1. Inline links like `<http://example.com>` are highlighted incorrectly as
"    HTML tags

" 2. The HTML syntax definitions are duplicated badly; for example as set out
"    below:

" ```
" :syntax list htmlComment
" --- Syntax items ---
" htmlComment    xxx start=/<!/ end=/>/  contains=htmlCommentPart,htmlComment✂
"                    start=/<!DOCTYPE/ end=/>/  keepend
"                    links to Comment
" ```

" ```
" :syntax list htmlComment
" --- Syntax items ---
" htmlComment    xxx start=/<!/ end=/>/  contains=htmlCommentPart,htmlComment✂
"                    start=/<!DOCTYPE/ end=/>/  keepend
"                    start=/<!/ end=/>/  contained contains=htmlCommentPart,h✂
"                    start=/<!DOCTYPE/ end=/>/  contained keepend
"                    links to Comment
" ```

" The easiest solution is to prohibit them.
