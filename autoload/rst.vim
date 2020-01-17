" Suggested uses for these functions:
"
function! rst#headings() abort "{{{
" provide a table of contents in the location list
  lgete ''
  set errorformat=%f:%l:%m
python3 << EOF
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
  call maktaba#buffer#Substitute('|', "\t")
  setlocal nomodifiable
  setlocal nomodified
  syn match   qfFileName  "^[^\t]*" nextgroup=qfSeparator
  syn match   qfSeparator "\t" nextgroup=qfLineNr contained
  syn match   qfLineNr    "[^\t]*" contained contains=qfError
  syn match   qfError     "error" contained
endfunction "}}}
function! rst#foldexpr( lnum ) abort "{{{
  if getline(a:lnum)=~#'^.. vim:'
    return 0 " modelines are not in foldings
  elseif getline(a:lnum)!=#'' && getline(a:lnum+1)=~#'^---'
    return '>1' " headings start folds but transitions do not
  else
    return '=' " continue previous fold
  endif
endfunction "}}}
" vim: set foldmethod=marker foldlevel=0 :
