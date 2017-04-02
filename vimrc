" --------------------
" vimrc, Keith Maxwell
" --------------------
"
" Installation {{{1
"
" Windows: follow instructions in ./README
" Unix: Add ``source /root/configuration/vimrc`` to /etc/vim/vimrc.local
"
" }}}
if !has('nvim') | set encoding=utf-8 | endif
scriptencoding utf-8
if !has('nvim') | if has('win32')| set viminfo='20,<50,h,n$TMP/viminfo |
    \ else | set viminfo='20,<50,h,n/tmp/cache/viminfo | endif | endif
if has('win32') | let $HOME=$USERPROFILE.'\Documents' | endif
if has('win32') && getcwd() ==? $USERPROFILE | cd $HOME | endif

if v:version < 703 | finish | endif

" File types, plugins and runtimepath {{{1
" -----------------------------------
"
set modeline                    "use modelines
set exrc                        "look for local _vimrc"
set secure                      "to match above

let s:path = expand('<sfile>:p:h')
let s:path .= '/runtimepath/bundle/vim-pathogen/autoload/pathogen.vim'
if filereadable(s:path) | execute 'source '.s:path | endif
unlet s:path
if exists('g:loaded_pathogen')
    call pathogen#infect(expand('<sfile>:p:h').'/runtimepath/bundle/{}')
endif
" pathogen#infect must come before set runtimepath
if isdirectory(expand('~/timesheet/bundle'))
    set runtimepath+=~/timesheet/bundle
endif
execute 'set runtimepath^='.expand('<sfile>:p:h').'/runtimepath/'
if exists('g:loaded_pathogen') | call pathogen#helptags() | endif
execute 'set runtimepath+='.expand('<sfile>:p:h').'/runtimepath/after'
"http://vim.1045645.n5.nabble.com/Issues-with-ftdetect-td1193595.html
filetype off
filetype on
filetype plugin on              "load plugins
" vimpager options {{{2
" ----------------
"
if exists('vimpager') | highlight link eolWhiteSpace NONE | endif
let g:vimpager_passthrough = 1
" Plugin options in global variables {{{2
" ----------------------------------
"
"dbext options in ftplugin/sql.vim aren't loaded for Python or RST filetypes
let g:dbext_default_always_prompt_for_variables=1
let g:dbext_default_profile = 'db'
let g:dbext_default_profile_db = 'type=SQLITE:dbname=db.sqlite'
let g:dbext_default_history_file = $XDG_CONFIG_HOME.'/dbext_sql_history.txt'
let g:dbext_default_SQLITE_cmd_header =
    \ ".mode column\n.headers ON\nPRAGMA foreign_keys = ON;\n"
let g:dbext_default_parse_statements =
    \ 'select,update,delete,insert,call,exec,with,drop,create'
let g:ftplugin_sql_omni_key       = '<Leader>c' "See :help omni-sql-completion
let g:ftplugin_sql_omni_key_right = '<Tab>'
let g:ftplugin_sql_omni_key_left  = '<S-Tab>'
let g:gitgutter_enabled = 0
let g:is_posix=1                "$() isn't an error in sh
let g:netrw_banner=0
let g:rst_syntax_code_list = ['vim', 'java', 'sql', 'python', 'sh']
let g:sh_fold_enabled= 3
let g:sql_type_default = 'sqlite'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_ignore_files = ['.*dbext_sql_history.txt']
let g:syntastic_sh_shellcheck_args = '-x'
"Editing and movement {{{1
"--------------------
"
set backspace=indent,eol,start  "backspace deletes special characters
set formatlistpat=^\\s*[0-9-#•]\\+[.\ ]\\s*\\\|^\\s*[a-z]\\.\\s
set formatoptions+=n            "format lists
set ignorecase                  "case insensitive searches
set linebreak                   "do not wrap in the middle of a word
set nojoinspaces                "one space between sentences
set nostartofline
set nrformats+=alpha
set nrformats-=octal            " increment 07 to 08 and not 010
set smartcase                   "override ignorecase if upper case characters

"Interface options {{{2
"-----------------
set kp=                         "use `K` for `:help`
set wildmenu                    "normal mode tab completion menu
set confirm                     "prompt before discarding changes
set history=200
set shortmess+=I
if filereadable('/etc/gentoo-release') | set laststatus=2 | endif

"File name options for :find etc. {{{2
"--------------------------------
"
" Doesn't search dotfiles like /.vim/
set path+=$HOME/**              "recursively search below home directory
if has('win32') | set path+=$HOME/../Desktop/** | endif
set suffixesadd+=.txt
set suffixesadd+=.bf
set isfname+=?                  "for web addresses
set isfname+=&                  "for web addresses
"Tabs {{{2
"----
"
set expandtab
set shiftwidth=4
set shiftround
set softtabstop=4               "backspace removes an expanded tab
set tabstop=4
set autoindent

"autocommands {{{1
"-------------
"

" clear autocommands
" prevents syntax highlighting if this appears after `:syntax enable`
autocmd!

"Filetypes {{{2
"--------
"
"Move to a file in ftplugin if more that one line per file-type:
augroup vimrc
autocmd FileType dosini set isfname-=\= "complete e.g. home=/home/liveuser
autocmd FileType sh set noexpandtab
"Gentoo binary packages; concatentated .tar.bz2 and xpak; so will show an error
autocmd BufReadCmd *.tbz2 call tar#Browse(expand("<amatch>"))
augroup end

"Paths {{{2
"-----
"
autocmd BufEnter */.gvfs/* set noswapfile
autocmd BufRead COMMIT_EDITMSG setlocal nomodeline | setlocal spell
autocmd StdInReadPost * setlocal nowrap

" Display {{{1
" -------
"
if has('gui_win32')
    set guifont=Source_Code_Pro:h14,Consolas:h14
    set lines=35
endif
if has('win32')
    try | colorscheme summerfruit256 | catch /E185/ | endtry
else
    try
        colorscheme solarized | set background=dark
    catch /E185/
    endtry
endif

" Only works if a single option per line
set guioptions+=c  " keyboard workaround for file changed dialog
set guioptions-=m  "no menu
set guioptions-=T  "no toolbar
set guioptions-=r  "no scrollbar
set guioptions-=L  "no scrollbar
set shortmess+=I   "no welcome message
if !has('nvim') | set clipboard=unnamed | endif
set ruler          "show position
set hlsearch
set splitbelow
set showcmd
set colorcolumn=80
" workaround for windows console
if !has('gui_running') | set highlight+=vr | set t_Co=16 | endif

" The order of the next two lines is essential
syntax enable                   "syntax highlighting
autocmd Syntax * syntax match eolWhiteSpace display excludenl containedin=ALL
    \ "\s\+$"
doautocmd Syntax
highlight link eolWhiteSpace ErrorMsg
"Functions {{{1
"---------
function! Sum() range "{{{2
"Assumes 'selection' is blockwise and inclusive
python3 <<EOS
import vim
import decimal
top, left       = vim.eval("getpos(\"'<\")[1:2]")
bottom, right   = vim.eval("getpos(\"'>\")[1:2]")
top, left, bottom, right = int(top), int(left), int(bottom), int(right)
numbers = [i[left - 1:right] for i in vim.current.buffer[top - 1:bottom]]
numbers = [i.replace(',','').rstrip('\xc2\xa3 ') for i in numbers]
result = '{:,}'.format(sum(decimal.Decimal(i) for i in numbers if i))
print(result)
EOS
let @= = "'".py3eval('result')."'"
endfunction "}}}2

"   Mappings and commands {{{1
"   ---------------------
"
" Functions for mappings {{{
" Clipboard on ChromeOS: First save
" https://raw.githubusercontent.com/chromium/hterm/master/etc/osc52.vim to
" gentoo/osc52.vim
if filereadable(expand('<sfile>:p:h').'/gentoo/osc52.vim')
    execute 'source '.expand('<sfile>:p:h').'/gentoo/osc52.vim'
    " can also be used via ":call" for example:
    " :call SendViaOSC52(@a)
endif
" }}}

if filereadable('/etc/gentoo-release') | inoremap Â£ £| endif
inoremap <Leader>t <C-R>=sql#complete_tables()<CR>
noremap Y y$
" alphabetical - `:sort i`
noremap <C-L> :noh<CR><C-L>
"       <Leader>c  see above g:ftplugin_sql_omni_key
vnoremap <Leader>= :<C-U>call Sum()<CR>
nmap <Leader>b :call vimrc#toggle()<CR>
call opfunc#opfuncmap('c')
noremap <Leader>fc :find cipher.bf<CR>
noremap <Leader>fu :find URLs.txt<CR>
noremap <Leader>ft :find Timesheet.txt<CR>
noremap <Leader>g :call gmail#get()<CR>
noremap <Leader>G :call gmail#put()<CR>
noremap <Leader>h :call rst#headings()<CR>
noremap <Leader>i :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
call opfunc#opfuncmap('j', 'jupyter')
nmap <Leader>J :call jupyter#toggle()<CR>
vnoremap <Leader>k <ESC>:if line("'<") > 1 \| 0,'<-1d \| en \|
    \ if line("'>") < line('$') \| '>+1,$d \| en<CR>0gg
call opfunc#opfuncmap('l')  "run in dbext
call opfunc#opfuncmap('L')  "run in dbext with .mode list
noremap <Leader>m :call vimrc#toggle_jobs()<CR>
noremap <Leader>/ :s,\\,/,g<CR><C-L>
if has('win32') " has('clipboard') loads an nvim provider, showing a message
    noremap <Leader>p :%d _ \| pu + \| 1d \| normal G<CR>
else
    noremap <Leader>p :%d _ \| pu " \| 1d \| normal G<CR>
endif
noremap <Leader>R :SyntasticReset<CR>
noremap <Leader>r :SyntasticToggleMode<CR>
noremap <Leader>v :set paste! paste?<CR>
noremap <Leader>w :call rst#wrap()<CR>
call opfunc#opfuncmap('y')
call opfunc#opfuncmap('Y')
" The two lines below prevent vim-gitgutter over-riding [c and ]c
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
command! -nargs=+ Jupyter :call jupyter#command(<q-args>)

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
