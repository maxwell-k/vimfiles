set guioptions+=c  " keyboard workaround for file changed dialog 
set guioptions-=m  " only works if a single option per line
set guioptions-=T
call pathogen#infect()
colorscheme solarized
set t_Co=16
set background=dark
set expandtab
set shiftwidth=4
set tabstop=4
set linebreak
set kp= " use `K` for `:help`
noremap <C-L> :noh<CR><C-L>
" launch google-chrome on the URL under the cursor with control enter
noremap <C-CR> :silent !google-chrome "<cfile>" &<CR>
" reStructuredText {{{1
autocmd FileType rst set textwidth=80
" provide a table of contents in the location list {{{2
function! Headings()
if &ft == 'rst'
    lgete ''
    set errorformat=%f:%l:%m

python << EOF
from __future__ import print_function
import vim
import docutils.parsers.rst
import docutils.utils

source = vim.current.buffer
settings = docutils.frontend.OptionParser(
                    components=(docutils.parsers.rst.Parser,)
                    ).get_default_values()
parser = docutils.parsers.rst.Parser()
document = docutils.utils.new_document(source.name, settings)
parser.parse('\n'.join(source), document)
command = "lad '{0}:{1}:\t{2}'"
for i in document:
    if type(i) == docutils.nodes.section:
        vim.command(command.format(source.name, i.line - 1, i[0][0]))
EOF
    lopen
    setlocal modifiable
    %s/|/\t/g
    setlocal nomodifiable
    setlocal nomodified
    syn match	qfFileName	"^[^\t]*" nextgroup=qfSeparator
    syn match	qfSeparator	"\t" nextgroup=qfLineNr contained
    syn match	qfLineNr	"[^\t]*" contained contains=qfError
    syn match	qfError		"error" contained
endif
endf
autocmd FileType rst noremap <F1> :call Headings()<CR>
" shell scripts {{{1
autocmd BufEnter /tmp/bash-fc* set ft=sh      "highlighting for fc
autocmd FileType sh set noexpandtab
autocmd FileType sh let g:is_posix = 1
autocmd FileType sh let g:sh_fold_enabled= 3 
" vim: set foldmethod=marker :{{{1
