" ---------------------------------------
" vimrc, Keith Maxwell, 19 September 2012
" ---------------------------------------
"
" {{{ To install on Windows, add the following line to  `C:\Program
" Files\Vim\_vimrc`::
"
"     source C:\Documents\ and\ Settings\...
"
" If this file is sourced by $VIM\_gvimrc plugins will not load.
" `gvim -u NORC -N` starts vim with no rc file and in nocompatible mode. }}}

set nocompatible
if v:version < 703
    finish
endif

call pathogen#infect()
call pathogen#helptags()

" Windows {{{1
" -------
"
if has('win32',)
    " match the home directory to that used by git
    let $HOME='C:/Documents and Settings/887561/My Documents'
    set viminfo='20,<50,h,n$HOME/Personal/housekeeping/cache/viminfo
    "
    " To understand how syntastic works see the separate files in::
    "
    " C:\Program Files\vim\vimfiles\bundle\syntastic\syntax_checkers\
    "
    " Some file types need a batch file to properly call the syntax checker on
    " Windows. For each such file type below is the name, batch filename,
    " example location and contents.
    "
    " 'python' flake8.bat e.g. ~/Personal/housekeeping/bin/flake8.bat ::
    "
    "   python -c "import flake8.run; flake8.run.main()" %*
    "
    " 'rst' rst2pseudoxml.py.bat e.g.
    " ~/Personal/housekeeping/bin/rst2pseudoxml.py.bat ::
    "
    "	set "l1=import docutils.core;"
    "	set "l2=docutils.core.publish_cmdline("
    "	set "l3=settings_overrides={'exit_status_level': 1, 'report_level': 2})"
    "	python -c "%l1%%l2%%l3%" %5 1> NUL
    "
    let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': ['sh', 'python', 'rst'],
                               \ 'passive_filetypes': [] }
endif

"autocommands {{{1
"-------------
"

" clear autocommands
" prevents syntax highlighting if this appears after `:syntax enable`
autocmd!

"let gx work on both <./vimlogo.gif> and ./vmlogo.gif
autocmd VimEnter * nno <silent>
    \<Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)<cr>

"Filetypes {{{2
"--------
"
autocmd FileType ledger let g:ledger_bin="ledger.exe"
autocmd FileType ledger let g:ledger_fillstring = '·'
autocmd FileType ledger noremap <silent><buffer> <F1>
    \ :call LedgerToggleTransactionState(line('.'), ' *')<CR>
autocmd FileType ledger set spell
autocmd FileType ledger set noautoindent
autocmd FileType ledger noremap <silent><buffer> <F2> :set foldlevel=0<CR>
autocmd FileType sh set noexpandtab
autocmd FileType rst set textwidth=79
autocmd FileType rst set spell
autocmd FileType rst noremap <F1> :call <SID>:headings()<CR>
autocmd FileType rst noremap <F10> :call <SID>:view_rst_as_html()<CR>

"Paths {{{2
"-----
"
autocmd BufAdd */Projects/safe/*.bf
    \execute "source " . expand("<afile>:h") . "\\safe.vim"
autocmd BufEnter cipher.bf set ft=rst
autocmd BufEnter *.txt set suffixesadd=.txt
autocmd BufEnter */.gvfs/* set noswapfile
autocmd BufEnter */planning/*.txt syn match error display excludenl "\s\+$"
autocmd BufEnter */planning/*.txt set ft=rst
autocmd BufEnter *.json set ft=javascript
autocmd BufEnter *.txt syn match error display excludenl "\s\+$"
autocmd BufEnter history.py setlocal autoread
autocmd BufEnter history.py setlocal nomodifiable
autocmd BufEnter /tmp/bash-fc* set ft=sh      "highlighting for fc

" Display {{{1
" -------
"
colorscheme solarized
if has('gui_win32')
    set background=light
else
    set background=dark
endif
" Only works if a single option per line
set guioptions+=c  " keyboard workaround for file changed dialog
set guioptions-=m  "no menu
set guioptions-=T  "no toolbar
set guioptions-=r  "no scrollbar
set guioptions-=L  "no scrollbar
set ruler          "show position
set hlsearch
set t_Co=16
if has('gui_win32')
    set guifont=Lucida_Console:h14:cANSI    "font
endif
if ! has('gui_running')
    set highlight+=vr " workaround for windows console
endif

"Editing {{{1
"-------
"
set encoding=utf-8
set backspace=indent,eol,start  "backspace deletes special characters
set linebreak                   "do not wrap in the middle of a word
set formatoptions+=n            "format lists
set formatlistpat=^\\s*[0-9-#]\\+[.\ ]\\s*\\\|^\\s*[a-z]\\.\\s
set nrformats-=octal            " increment 07 to 08 and not 010
match ErrorMsg /[ \t]\+$/

"Tabs {{{2
"----
"
set expandtab
set shiftwidth=4
set softtabstop=4               "backspace removes an expanded tab
set tabstop=4
set autoindent

"General {{{1
"-------
"
filetype plugin on              "load plugins
syntax enable                   "syntax highlighting
let g:netrw_banner=0
let g:is_posix=1                "$() isn't an error in sh
let g:sh_fold_enabled= 3
set modeline                    "use modelines
set exrc                        "look for local _vimrc"
set secure                      "to match above
set wildmenu                    "normal mode tab completion menu
set confirm                     "prompt before discarding changes
set ignorecase                  "case insensitive searches
set smartcase                   "override above if upper case characters
set kp=                         " use `K` for `:help`

"Functions {{{1
"---------
"

function! <SID>:open() "{{{2
    if has('gui_win32',)
        " open the file linked from the current line
        let l:command = '!C:\WINDOWS\system32\rundll32.exe '
        let l:command .= "url.dll,FileProtocolHandler "
        if getline(".") =~ "^-\\s*`"
            "rst link inside a bullet
            let l:path = getline(".")
            let l:path = substitute(l:path, '^-\s\+`[^<]\+<file:', '', '')
            let l:path = substitute(l:path, '>`_$', '', '')
            let l:path = substitute(l:path, '/', '\\', 'g')
        else
            let l:path = ''
            if &filetype == 'netrw'
                let l:path .= b:netrw_curdir . '\'
            end
            let l:path .= substitute(getline("."), '^\s\+', '', '')
        endif
        let l:command .= shellescape(l:path)
        silent execute l:command
        "echo l:command
    else
        " launch google-chrome on the URL under the cursor
        silent !google-chrome "<cfile>" &
    endif
endf

function! <SID>:execute_line() "{{{2
    "read the result of a line
    execute ":r !" . getline(".")
endf

function! <SID>:toggle_ve() "{{{2
    "toggle ve
    if &ve == ''
        set ve=all
    else
        set ve=
    endif
endf

function! <SID>:toggle_lines() "{{{2
    "to toggle size
    if &lines == 25
        set lines=10
    else
        set lines=25
    endif
endf

function! <SID>:headings() "{{{2
" provide a table of contents in the location list 
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

function! <SID>:view_rst_as_html() "{{{2
" TODO: test on Linux
python <<EOF
import tempfile
import webbrowser

import vim
import docutils.core

output = tempfile.NamedTemporaryFile(suffix=".html", delete=False)
try:
    output.write(docutils.core.publish_string(
        "\n".join(vim.current.buffer), writer_name="html"))
finally:
    output.close()
webbrowser.open(output.name)
EOF
endf

"   Mappings {{{1
"   --------
"
noremap <C-L> :noh<CR><C-L>
noremap <C-CR> :call <SID>:open()<CR>
noremap <F2> :call <SID>:execute_line()<CR>
noremap <F3> :call <SID>:toggle_ve()<CR>
noremap <F4> :call <SID>:toggle_lines()<CR>
noremap <F5> :silent !explorer %:p:h &<CR>
noremap <F6> :s/^/"/<CR>:s/$/"/<CR>:noh<CR>
noremap <F11> :%d<CR>:pu! +<CR>
noremap <F12> :%y +<CR>

"Digraphs {{{1
"--------
"
"   http://www.unicode.org/charts/charindex.html
"   http://www.cs.tut.fi/~jkorpela/dashes.html
"   Use echo 0x2026 to convert to decimal
"   3 em dashes have no space in times or arial but do in calibri
digraph .. 8230
digraph n- 8211 "em dash
digraph m- 8212 "em dash

" vim: set foldmethod=marker :{{{1
