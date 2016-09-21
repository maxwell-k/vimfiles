" --------------------
" vimrc, Keith Maxwell
" --------------------
"
" Installation {{{1
"
" Windows
" Add the two lines below to %USERPROFILE\AppData\Local\Programs\vim\vimrc:
" set nocompatible
" source C:\Users\MaxwellK\Documents\configuration\vimrc
"
" Unix
" Add the line below to /etc/vim/vimrc.local:
" source /root/configuration/vimrc
"
" Testing
" ``gvim -u NORC -N`` starts vim with no rc file and in nocompatible mode.
" }}}
if !has('nvim') | set encoding=utf-8 | endif
scriptencoding utf-8
if !has('nvim') | set viminfo='20,<50,h,n~/configuration/cache/viminfo | endif
if has('win32') | let $HOME=$USERPROFILE.'\Documents' | endif
if has('win32') && getcwd() ==? $USERPROFILE | cd $HOME | endif

if v:version < 703 | finish | endif

" File types, plugins and runtimepath {{{1
" -----------------------------------
"
set modeline                    "use modelines
set exrc                        "look for local _vimrc"
set secure                      "to match above

execute 'source '.expand('<sfile>:p:h')
    \ .'/runtimepath/bundle/vim-pathogen/autoload/pathogen.vim'
call pathogen#infect(expand('<sfile>:p:h').'/runtimepath/bundle/{}')
" pathogen#infect must come before set runtimepath
if isdirectory(expand('~/timesheet/bundle'))
    set runtimepath+=~/timesheet/bundle
endif
execute 'set runtimepath^='.expand('<sfile>:p:h').'/runtimepath/'
call pathogen#helptags()
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
let g:dbext_default_profile = 'db'
let g:dbext_default_profile_db = 'type=SQLITE:dbname=db.sqlite'
let g:dbext_default_history_file = $XDG_CONFIG_HOME.'/dbext_sql_history.txt'
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
	colorscheme summerfruit256
else
    colorscheme solarized
    set background=light
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
"
function! s:get_visual_selection() "{{{2
  " Return the visually selected text, from:
  " http://stackoverflow.com/questions/1533565/
  " how-to-get-visually-selected-text-in-vimscript
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection ==# 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
function! s:open() "{{{2
    if has('win32',)
        " open the file linked from the current line
        let l:command = '!C:\WINDOWS\system32\rundll32.exe '
        let l:command .= 'url.dll,FileProtocolHandler '
        if getline('.') =~# '^-\s*`'
            "rst link inside a bullet
            let l:path = getline('.')
            let l:path = substitute(l:path, '^-\s\+`[^<]\+<file:', '', '')
            let l:path = substitute(l:path, '>`_$', '', '')
            let l:path = substitute(l:path, '/', '\\', 'g')
        else
            let l:path = ''
            if &filetype ==# 'netrw'
                let l:path .= b:netrw_curdir . '\'
            end
            let l:path .= substitute(getline('.'), '^\s\+', '', '')
        endif
        let l:command .= shellescape(l:path)
        silent execute l:command
        "echo l:command
    endif
endfunction
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
print('{:,}'.format(sum(decimal.Decimal(i) for i in numbers if i)))
EOS
endfunction

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
function! s:gmail_put() "{{{
    if executable('api-put.py')
        execute 'write !api-put.py'
    else
        execute 'write !api.py --put'
    endif
    set nomodified
endfunction }}}
function! s:gmail_get() "{{{
    execute 'read !api.py'
    if getline(1) ==# '' | 1delete | endif
endfunction "}}}
function! Copfunc(type, ...) " Straight yank {{{
    let sel_save = &selection
    let &selection = 'inclusive'
    let reg_save = @@ " unnamed register

    call jupyter#opfuncInput(a:type, a:0)
    call jupyter#opfuncOutput(@@)

    let &selection = sel_save | let @@ = reg_save
endfunction
" }}}
function! Yopfunc(type, ...) " Yank as a single line separated by spaces {{{
    let sel_save = &selection | let &selection = 'inclusive' |let reg_save = @@

    call jupyter#opfuncInput(a:type, a:0)
    let @@ = substitute(@@, '\\\n', '', 'g')
    let @@ = substitute(@@, '\n', ' ', 'g')
    let @@ = substitute(@@, '^ \+', '', '')
    let @@ = substitute(@@, ' \+$', '', '')
    let @@ = substitute(@@, ' \+', ' ', 'g')
    call jupyter#opfuncOutput(@@)

    let &selection = sel_save | let @@ = reg_save
endfunction
" }}}
function! Yopfunc2(type, ...) " Yank as with whitespace removed {{{
    let sel_save = &selection | let &selection = 'inclusive' |let reg_save = @@

    call jupyter#opfuncInput(a:type, a:0)
    let @@ = substitute(@@, '\n', '', 'g')
    let @@ = substitute(@@, ' \+', '', 'g')
    call jupyter#opfuncOutput(@@)

    let &selection = sel_save | let @@ = reg_save
endfunction
"}}}
" }}}
if filereadable('/etc/gentoo-release') | inoremap Â£ £| endif
noremap Y y$
" alphabetical - `:sort i`
noremap <C-L> :noh<CR><C-L>
"       <Leader>c  see above g:ftplugin_sql_omni_key
vmap <Leader>= :<C-U>call Sum()<CR>
nmap <silent> <Leader>c :set opfunc=Copfunc<CR>g@
vmap <silent> <Leader>c :<C-U>call Copfunc(visualmode(), 1)<CR>
nmap <silent> <Leader>cc :<C-U>call Copfunc(v:count1)<CR>
noremap <Leader>fc :find cipher.bf<CR>
noremap <Leader>ft :find Timesheet.txt<CR>
noremap <Leader>g :call <SID>gmail_get()<CR>
noremap <Leader>G :call <SID>gmail_put()<CR>
noremap <Leader>i :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
nmap <Leader>j :set opfunc=jupyter#opfunc<CR>g@
vmap <Leader>j :<C-U>call jupyter#opfunc(visualmode(), 1)<CR>
nmap <Leader>jj :<C-U>call jupyter#opfunc(v:count1)<CR>
nmap <Leader>J :call jupyter#toggle()<CR>
vnoremap <Leader>k <ESC>:if line("'<") > 1 \| 0,'<-1d \| en \|
    \ if line("'>") < line('$') \| '>+1,$d \| en<CR>0gg
noremap <Leader>/ :s,\\,/,g<CR><C-L>
if has('win32') " has('clipboard') loads an nvim provider, showing a message
    noremap <Leader>p :%d _ \| pu + \| 1d<CR>
else
    noremap <Leader>p :%d _ \| pu " \| 1d<CR>
endif
noremap <Leader>R :SyntasticReset<CR>
noremap <Leader>r :SyntasticToggleMode<CR>
noremap <Leader>t :GitGutterToggle<CR>
noremap <Leader>v :set paste! paste?<CR>
noremap <Leader>w :w ~/notes/<C-R>=strftime("mn%Y%m%d-", localtime())<CR>
nmap <silent> <Leader>y :set opfunc=Yopfunc<CR>g@
vmap <silent> <Leader>y :<C-U>call Yopfunc(visualmode(), 1)<CR>
nmap <silent> <Leader>yy :<C-U>call Yopfunc(v:count1)<CR>
nmap <silent> <Leader>Y :set opfunc=Yopfunc2<CR>g@
vmap <silent> <Leader>Y :<C-U>call Yopfunc2(visualmode(), 1)<CR>
nmap <silent> <Leader>YY :<C-U>call Yopfunc2(v:count1)<CR>
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
