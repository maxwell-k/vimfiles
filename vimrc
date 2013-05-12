" --------------------------------
" vimrc, Keith Maxwell, 4 May 2013
" --------------------------------
"
set nocompatible  " Affects viminfo
if has('win32',) " Using on Windows {{{
    " • To install on Windows, `source` this file from `_vimrc` in `$VIM`.
    " • If this file is sourced by $VIM\_gvimrc plugins will not load.
    " • `gvim -u NORC -N` starts vim with no rc file and in nocompatible mode.

    " Match the home directory to that used by git
    let $HOME='C:/Users/887561/Documents'
    set viminfo='20,<50,h,n$HOME/configuration/cache/viminfo
    set runtimepath+=~/configuration/runtimepath
    " Avoid creating swap files on a server and
    " move into git HOME if in Windows HOME
    if fnamemodify('.',':p') ==? 'I:\'
        \ || fnamemodify('.',':p') ==? 'C:\Users\887561\'
        cd $HOME
    endif
endif " }}}

if v:version < 703
    finish
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()  " Needs write access to ~/.vim

"Editing {{{1
"-------
"
set encoding=utf-8
set backspace=indent,eol,start  "backspace deletes special characters
set linebreak                   "do not wrap in the middle of a word
set formatoptions+=n            "format lists
set formatlistpat=^\\s*[0-9-#•]\\+[.\ ]\\s*\\\|^\\s*[a-z]\\.\\s
set nrformats-=octal            " increment 07 to 08 and not 010

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
autocmd VimEnter * redraw!

"Filetypes {{{2
"--------
"
"Move to a file in ftplugin if more that one line per file-type:
autocmd FileType dosini set isfname-=\= "complete e.g. home=/home/liveuser
autocmd FileType gitcommit match none
autocmd FileType sh set noexpandtab

"Paths {{{2
"-----
"
autocmd BufEnter */.gvfs/* set noswapfile
autocmd BufEnter history.py setlocal autoread
autocmd BufEnter history.py setlocal nomodifiable
autocmd BufAdd */ledger/* execute 'lcd' fnameescape(expand("%:h"))
autocmd BufEnter */ledger/* set runtimepath+=runtimepath
autocmd BufEnter */ledger/all set filetype=ledger
autocmd BufRead */safe/*.bf execute 'lcd' fnameescape(expand("%:h"))
autocmd BufRead */safe/*.bf source safe.vim
autocmd BufEnter */timesheet/*.txt execute 'lcd' fnameescape(expand("%:h"))
autocmd BufEnter */timesheet/*.txt source Timesheet.vim
" % isn't the same as <afile> with netrw
autocmd BufAdd planning execute 'lcd' fnameescape(expand("<afile>:p"))
autocmd BufAdd planning source Plan.vim "Won't match find planning/
autocmd BufEnter */planning/**.txt execute 'lcd'
    \ fnameescape(expand("<afile>:h:p"))
autocmd BufEnter */planning/*/**.txt execute 'lcd'
    \ system('git rev-parse --show-cdup')
autocmd BufEnter */planning/**.txt source Plan.vim
autocmd BufRead COMMIT_EDITMSG setlocal nomodeline
autocmd StdInReadPost * setlocal nowrap

" Display {{{1
" -------
"
let vimpager_passthrough = 1
if has('gui_win32')
    set guifont=Source_Code_Pro:h14
    colorscheme summerfruit256
else
    colorscheme solarized
    set background=dark
endif

" Only works if a single option per line
set guioptions+=c  " keyboard workaround for file changed dialog
set guioptions-=m  "no menu
set guioptions-=T  "no toolbar
set guioptions-=r  "no scrollbar
set guioptions-=L  "no scrollbar
set guioptions+=a  "automatically update "*
set ruler          "show position
set hlsearch
set splitbelow
set showcmd
if ! has('gui_running')
    set highlight+=vr " workaround for windows console
    set t_Co=16
endif

"General {{{1
"-------
"
filetype plugin on              "load plugins
" The order of the next two lines is essential
syntax enable                   "syntax highlighting
autocmd Syntax * syntax match eolWhiteSpace display excludenl containedin=ALL
    \ "\s\+$"
doautocmd Syntax
highlight link eolWhiteSpace ErrorMsg
if exists("vimpager")
    highlight clear eolWhiteSpace
endif
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
set path+=$HOME/**              "recursively search below current directory
set nojoinspaces                "one space between sentences
set suffixesadd+=.txt
set suffixesadd+=.bf

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
function! Sum() range "{{{2
python <<EOS
import vim
import decimal
print('{:,}'.format(sum(
    decimal.Decimal(i.replace(',','').rstrip('\xc2\xa3 '))
    for i in vim.eval("@*").split("\n")
    if i)))
EOS
endfunction


"   Mappings {{{1
"   --------
"
noremap <C-L> :noh<CR><C-L>
" <C-CR> is hidden by gnome-terminal
" <F1> is hidden by gnome-terminal
noremap <F3> :execute ":r !" . getline(".")<CR>
noremap <F2> :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
if has('win32')
    noremap <F4> :call <SID>:open()<CR>
    noremap <F5> :silent !explorer %:p:h &<CR>
else
    noremap <F4> :silent !xdg-open <cfile> &<CR><C-L>
    noremap <F5> :silent !nautilus %:p:h &<CR>
endif
noremap <F6> :s/^/"/<CR>:s/$/"/<CR>:noh<CR>
vnoremap <F9> <Esc>:g!/\%V/d<CR>`<:noh<CR>
" <F10> is hidden by gnome-terminal
" <F11> is hidden by gnome-terminal
noremap <F11> :%d<CR>:pu! +<CR>
noremap <F12> :%y +<CR>
noremap <S-F12> "+yiW

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

" vim: set foldmethod=marker :{{{1
