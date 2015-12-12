" ------------------------------------
" vimrc, Keith Maxwell, 3 October 2014
" ------------------------------------
"
set nocompatible  " Affects viminfo
set viminfo='20,<50,h,n$HOME/configuration/cache/viminfo
if has('win32',) " Using on Windows {{{
    " • To install on Windows, `source` this file from `_vimrc` in `$VIM`.
    " • If this file is sourced by $VIM\_gvimrc plugins will not load.
    " • `gvim -u NORC -N` starts vim with no rc file and in nocompatible mode.

    " Match the home directory to that used by git
    let $HOME=$USERPROFILE.'\Documents'
endif " }}}

if v:version < 703
    finish
endif

" File types, plugins and runtimepath {{{1
" -----------------------------------
"
set modeline                    "use modelines
set exrc                        "look for local _vimrc"
set secure                      "to match above
" s:path is the absolute path of the directory containing this file with links
" resolved and no trailing slash
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" Clipboard on ChromeOS: First save
" https://raw.githubusercontent.com/chromium/hterm/master/etc/osc52.vim to
" gentoo/osc52.vim
if filereadable(s:path . '/gentoo/osc52.vim')
    execute 'source ' . s:path . '/gentoo/osc52.vim'
    map <Leader>y :call SendViaOSC52(getreg('"'))<CR>
endif

execute 'source '.s:path.
    \'/runtimepath/bundle/vim-pathogen/autoload/pathogen.vim'
call pathogen#infect(s:path.'/runtimepath/bundle/{}')
" pathogen#infect must come before set runtimepath
execute 'set runtimepath^='.s:path.'/runtimepath'
call pathogen#helptags()  " Needs write access to ~/.vim
execute 'set runtimepath+='.s:path.'/runtimepath/after'
"http://vim.1045645.n5.nabble.com/Issues-with-ftdetect-td1193595.html
filetype off
filetype on
filetype plugin on              "load plugins
" vimpager options {{{2
" ----------------
"
if exists("vimpager")
    highlight link eolWhiteSpace NONE
endif
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
let g:sh_fold_enabled= 3
let g:sql_type_default = 'sqlite'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_rst_rst2pseudoxml_exe = 'python -c
    \ "from docutils.core import publish_cmdline; publish_cmdline()"'
"Editing and movement {{{1
"--------------------
"
set backspace=indent,eol,start  "backspace deletes special characters
set encoding=utf-8
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

"File name options for :find etc. {{{2
"--------------------------------
"
" Doesn't search dotfiles like /.vim/
set path+=$HOME/**              "recursively search below home directory
if has('gui_win32')             "Windows Desktop
    set path+=$HOME/../Desktop/**
endif
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
autocmd FileType sh set noexpandtab

"Paths {{{2
"-----
"
autocmd BufEnter */.gvfs/* set noswapfile
autocmd BufEnter */timesheet/*.txt execute
    \ 'source '.expand('%:h').'/Timesheet.vim'
" % isn't the same as <afile> with netrw
" TODO: tidy up planning avoid cd
autocmd BufAdd,BufEnter planning,planning/
    \ execute 'lcd' fnameescape(expand("<afile>:p"))
autocmd BufAdd,BufEnter planning,planning/
    \ source Plan.vim "?Won't match find planning/?
autocmd BufEnter */planning/**.txt execute 'lcd'
    \ fnameescape(expand("<afile>:h:p"))
autocmd BufEnter */planning/*/**.txt execute 'lcd'
    \ system('git rev-parse --show-cdup')
autocmd BufEnter */planning/**.txt source Plan.vim
autocmd BufRead COMMIT_EDITMSG setlocal nomodeline | setlocal spell
autocmd StdInReadPost * setlocal nowrap

" Display {{{1
" -------
"
if has('gui_win32')
    set guifont=Source_Code_Pro:h14,Consolas:h14
    set lines=35
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
set shortmess+=I   "no welcome message
set clipboard=unnamed
set ruler          "show position
set hlsearch
set splitbelow
set showcmd
set colorcolumn=80
if ! has('gui_running')
    set highlight+=vr " workaround for windows console
    set t_Co=16
endif

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
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
function! s:open() "{{{2
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
"Assumes 'selection' is blockwise and inclusive
python <<EOS
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
function! s:gmail_get() "{{{2
    execute "read !api.py"
    if getline(1) == ''
        1delete
    endif
endfunction
function! s:gmail_put() "{{{2
    if executable('api-put.py')
        execute "write !api-put.py"
    else
        execute "write !api.py --put"
    endif
    set nomodified
endfunction

"   Mappings {{{1
"   --------
"
if filereadable('/etc/gentoo-release')
    inoremap Â£ £
endif
noremap Y y$
" alphabetical - `:sort i`
noremap <C-L> :noh<CR><C-L>
noremap <Leader>fc :find cipher.bf<CR>
noremap <Leader>fl :find all<CR>
noremap <Leader>ft :find Timesheet.txt<CR>
noremap <Leader>fv :find configuration/vimrc<CR>
noremap <Leader>g :call <SID>gmail_get()<CR>
noremap <Leader>G :call <SID>gmail_put()<CR>
if has('clipboard')
    noremap <Leader>p :%d _ \| pu + \| 1d<CR>
else
    noremap <Leader>p :%d _ \| pu " \| 1d<CR>
endif
noremap <Leader>x :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
noremap <Leader>w :w ~/notes/<C-R>=strftime("mn%Y%m%d-", localtime())<CR>
" In Windows <F12> opens a URL in IE & CTRL+<F12> opens in Google Chrome
noremap <Leader>t :call <SID>ToggleGitGutter()<CR>
function! s:ToggleGitGutter()
    if exists('g:gitgutter_enabled') && g:gitgutter_enabled
        GitGutterDisable
        noremap <C-L> :noh<CR><C-L>
    else
        GitGutterEnable
        noremap <C-L> :noh<CR>:GitGutter<CR><C-L>
    endif
endfunction
" The two lines below prevent vim-gitgutter over-riding [c and ]c
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
if has('win32')
    nnoremap <F12> :silent !start
        \ "C:\Program Files\Internet Explorer\iexplore.exe" <cfile><CR><CR>
    " To avoid escaping the &s
    nnoremap <C-F12> :execute ':silent !start '.
        \ '"C:\Program Files (x86)'.
        \ '\Google\Chrome\Application\chrome.exe" "'.
        \ escape(expand('<cfile>'), '%').'"'<CR><CR>
    if isdirectory($LOCALAPPDATA.'\Google\Chrome\User Data\Profile 1')
        " http://peter.sh/experiments/chromium-command-line-switches/
        nnoremap <C-S-F12> :execute ':silent !start '.
            \ '"C:\Program Files (x86)'.
            \ '\Google\Chrome\Application\chrome.exe" '.
            \ '--profile-directory '.
            \ '"'.$LOCALAPPDATA.'\Google\Chrome\User Data\Profile 1'.'"'.
            \ ' "'. expand('<cfile>').'"'<CR><CR>
    endif
    vnoremap <F12> :<BS><BS><BS><BS><BS>silent execute "!start"
        \ "\"C:\\Program Files\\Internet Explorer\\iexplore.exe\""
        \ substitute(substitute(<SID>get_visual_selection(),
        \ '[[:space:]]', '', 'g'), '%', '\\%', 'g')<cr><cr>
    vnoremap <C-F12> y:silent !start
        \ "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
        \ substitute(substitute(<SID>get_visual_selection(),
        \ '[[:space:]]', '', 'g'), '%', '\\%', 'g')<cr><cr>
endif

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
