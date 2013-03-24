" ---------------------------------------
" vimrc, Keith Maxwell, 25 December 2012
" ---------------------------------------
"
set nocompatible  " affects viminfo
" Using on Windows {{{
" ----------------
"
" To install on Windows, add the following line to  `C:\Program
" Files\Vim\_vimrc`::
"
"     source C:\Documents\ and\ Settings\...
"
" If this file is sourced by $VIM\_gvimrc plugins will not load.
" `gvim -u NORC -N` starts vim with no rc file and in nocompatible mode.
if has('win32',)
    " match the home directory to that used by git
    let $HOME='C:/Documents and Settings/887561/My Documents'
    set viminfo='20,<50,h,n$HOME/configuration/cache/viminfo
    set runtimepath+=~/configuration/runtimepath
endif

" Avoid creating swap files on a server
if fnamemodify('.',':p') == 'I:\'
    cd $HOME
endif
" }}}

if v:version < 703
    finish
endif

call pathogen#infect()
call pathogen#helptags()  " needs write access to ~/.vim

" Syntastic {{{1
" ---------
if has('win32',)
    "
    " To understand how syntastic works see the separate files in::
    "
    " C:\Program Files\vim\vimfiles\bundle\syntastic\syntax_checkers\
    "
    " Some file types need a batch file on PATH to properly call the syntax
    " checker on Windows. For each such file type below is the file type name,
    " batch filename and contents.
    "
    " 'python' flake8.bat
    "
    "   python -c "import flake8.run; flake8.run.main()" %*
    "
    " 'rst' rst2pseudoxml.py.bat
    "
    "   set "l1=import docutils.core;"
    "   set "l2=docutils.core.publish_cmdline("
    "   set "l3=settings_overrides={'exit_status_level': 1, 'report_level': 2})"
    "   python -c "%l1%%l2%%l3%" %5 1> NUL
    "
    let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': ['sh', 'python', 'rst'],
                               \ 'passive_filetypes': [] }
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
if exists("vimpager")
    match none
endif

"Tabs {{{2
"----
"
set expandtab
set shiftwidth=4
set softtabstop=4               "backspace removes an expanded tab
set tabstop=4
set autoindent

"autocommands {{{1
"-------------
"

" clear autocommands
" prevents syntax highlighting if this appears after `:syntax enable`
autocmd!

"let gx work on both <./vimlogo.gif> and ./vmlogo.gif
"See `:help expand(` for an explanation of expand(expand("<cfile>"))
autocmd VimEnter * nno <silent><Plug>NetrwBrowseX
    \ :call netrw#NetrwBrowseX(expand(expand("<cfile>")),0)<cr>

"Filetypes {{{2
"--------
"
autocmd FileType dosini set isfname-=\= "complete e.g. home=/home/liveuser
autocmd FileType gitcommit match none
autocmd FileType rst set textwidth=79
autocmd FileType rst set spell
autocmd FileType rst set formatoptions+=n "repeat from above, unset somewhere?
autocmd FileType sh set noexpandtab

"Paths {{{2
"-----
"
"TODO: move to safe repository
autocmd BufEnter */.gvfs/* set noswapfile
autocmd BufEnter */planning/*.txt set ft=rst
autocmd BufEnter *.json set ft=javascript
autocmd BufEnter *.txt syn match error display excludenl "\s\+$"
autocmd BufEnter history.py setlocal autoread
autocmd BufEnter history.py setlocal nomodifiable
autocmd BufEnter /tmp/bash-fc* set ft=sh      "highlighting for fc
autocmd BufEnter */ledger/* set runtimepath+=runtimepath
autocmd BufEnter */ledger/all set ft=ledger
autocmd BufRead COMMIT_EDITMSG setlocal nomodeline
autocmd StdInReadPost * setlocal nowrap

" Display {{{1
" -------
"
let vimpager_passthrough = 1
colorscheme solarized
set background=dark

" Only works if a single option per line
set guioptions+=c  " keyboard workaround for file changed dialog
set guioptions-=m  "no menu
set guioptions-=T  "no toolbar
set guioptions-=r  "no scrollbar
set guioptions-=L  "no scrollbar
set ruler          "show position
set hlsearch
set splitbelow
set t_Co=16
set showcmd
if has('gui_win32')
    set guifont=Source_Code_Pro:h14
endif
if ! has('gui_running')
    set highlight+=vr " workaround for windows console
endif

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
set kp=                         "use `K` for `:help`
set isfname+=?                  "for web addresses
set nojoinspaces                "one space between sentences

"Functions {{{1
"---------
"
function! <SID>:open() "{{{2
    if has('win32',)
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
    endif
endfunction
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
        syn match   qfFileName  "^[^\t]*" nextgroup=qfSeparator
        syn match   qfSeparator "\t" nextgroup=qfLineNr contained
        syn match   qfLineNr    "[^\t]*" contained contains=qfError
        syn match   qfError     "error" contained
    endif
endfunction
function! <SID>:view_rst_as_html() "{{{2
python <<EOF
import os
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
if os.path.isfile('/usr/bin/google-chrome'):
    # workaronud because webbrowser.open() seems to be broken on Generic Linux
    browser = webbrowser.BackgroundBrowser("google-chrome")
    browser.open(output.name)
else:
    webbrowser.open(output.name)
EOF
endfunction
function! <SID>:view_rst_as_odt() "{{{2
python <<EOF
import tempfile
import subprocess

import vim
import docutils.core

output = tempfile.NamedTemporaryFile(suffix=".odt", delete=False)
try:
    output.write(docutils.core.publish_string(
        "\n".join(vim.current.buffer), writer_name="odf_odt"))
finally:
    output.close()
if vim.eval("executable('winword')"):
    subprocess.Popen(['winword', output.name])
else:
    print(output.name)
EOF
endfunction

"   Mappings {{{1
"   --------
"
noremap <C-L> :noh<CR><C-L>
" <C-CR> is hidden by gnome-terminal
" <F1> is hidden by gnome-terminal
autocmd FileType rst noremap <buffer> <F1> :call <SID>:headings()<CR>
noremap <F3> :execute ":r !" . getline(".")<CR>
if has('win32')
    noremap <F5> :silent !explorer %:p:h &<CR>
    noremap <F4> :call <SID>:open()<CR>
else
    noremap <F5> :silent !nautilus %:p:h &<CR>
    noremap <F4> :silent !xdg-open <cfile> &<CR><C-L>
endif
noremap <F6> :s/^/"/<CR>:s/$/"/<CR>:noh<CR>
" <F10> is hidden by gnome-terminal
vnoremap <F9> <Esc>:g!/\%V/d<CR>`<:noh<CR>
autocmd FileType rst noremap <buffer> <F10> :call <SID>:view_rst_as_html()<CR>
autocmd FileType rst noremap <buffer> <S-F10> :call <SID>:view_rst_as_odt()<CR>
" <F11> is hidden by gnome-terminal
noremap <F11> :%d<CR>:pu! +<CR>
noremap <F12> :%y +<CR>
"IPython
let g:ipy_perform_mappings=0
autocmd FileType python
    \ map <silent> <S-Return> :python dedent_run_this_line()<CR>
autocmd FileType python
    \ vmap <silent> <S-Return> :python dedent_run_these_lines()<CR>
autocmd FileType python
    \ map <silent> <F1> :py if update_subchannel_msgs(force=True):
    \ echo("vim-ipython shell updated",'Operator')<CR>

"Digraphs {{{1
"--------
"
"   http://www.unicode.org/charts/charindex.html
"   http://www.cs.tut.fi/~jkorpela/dashes.html
"   Use echo 0x2026 to convert to decimal
"   3 em dashes have no space in times or arial but do in calibri
digraph .. 8230 " ellipsis …
digraph n- 8211 "em dash —
digraph m- 8212 "em dash –
digraph bu 8226 "bullet •

"}}} WIP
" vim: set foldmethod=marker :{{{1
