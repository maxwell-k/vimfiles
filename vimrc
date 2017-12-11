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
if !has('nvim') | set encoding=utf-8 viminfo='20,<50,h
  if has('win32') | set viminfo+=n$TMP/viminfo
  elseif filereadable('/etc/gentoo-release') | set viminfo+=n/tmp/cache/viminfo
endif | endif
scriptencoding utf-8

if v:version < 703 | finish | endif

" File types, plugins and runtimepath {{{1
" -----------------------------------
"
set modeline                    "use modelines
set exrc                        "look for local _vimrc"
set secure                      "to match above

execute 'set runtimepath^='.expand('<sfile>:p:h').'/runtimepath/'
execute 'set runtimepath+='.expand('<sfile>:p:h').'/runtimepath/after'
"http://vim.1045645.n5.nabble.com/Issues-with-ftdetect-td1193595.html
filetype off | filetype on
filetype plugin off | filetype plugin on "load plugins

" Plugin options in global variables {{{2
" ----------------------------------
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_ignore_files = ['.*dbext_sql_history.txt']
let g:syntastic_sh_shellcheck_args = '-x'
let g:markdown_folding=1

"Editing and movement {{{1
"--------------------
"
set backspace=indent,eol,start  " backspace deletes special characters
set formatlistpat=^\\s*[0-9-#•]\\+[.\ ]\\s*\\\|^\\s*[a-z]\\.\\s
set formatoptions+=n            " format lists
set ignorecase                  " case insensitive searches
set linebreak                   " do not wrap in the middle of a word
set nojoinspaces                " one space between sentences
set nostartofline               " don't move to start of line with H, M, L…
set nrformats+=alpha            " increment a to b
set nrformats-=octal            " increment 07 to 08 and not 010
set scrolloff=0                 " override settings from defaults.vim
set smartcase                   " override ignorecase if upper case characters

"Interface options {{{2
"-----------------
set keywordprg=                 "use `K` for `:help`
set wildmenu                    "normal mode tab completion menu
set confirm                     "prompt before discarding changes
set history=200
set shortmess+=I
if filereadable('/etc/gentoo-release') | set laststatus=2 | endif

"File name options for :find etc. {{{2
"--------------------------------
"
" Doesn't search dotfiles like /.vim/
set path+=**                    "recursively search below files directory
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
  set guifont=Source_Code_Pro:h14,Consolas:h14 | set lines=35
endif
if has('win32')
  try | colorscheme summerfruit256 | catch /E185/ | endtry
else
  try "{{{
    let g:solarized_termtrans=1 | set background=dark t_Co=16
    colorscheme solarized
    augroup solarized
    autocmd ColorScheme solarized highlight SpellBad cterm=standout ctermfg=9
    autocmd ColorScheme solarized highlight SpellCap cterm=standout ctermfg=4
    autocmd ColorScheme solarized highlight SpellLocal cterm=standout ctermfg=6
    autocmd ColorScheme solarized highlight SpellRare cterm=standout ctermfg=5
    autocmd ColorScheme solarized highlight Folded
      \ ctermfg=9 ctermbg=NONE cterm=NONE
    augroup END
  catch /E185/ | endtry " }}}
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
let s:list_settings = 'set list showbreak=→ '
let s:list_settings .= 'listchars=trail:←,tab:→—,extends:▓,precedes:▓'
execute s:list_settings

" workaround for windows console
if has('win32') && !has('gui_running') | set highlight+=vr t_Co=16 | endif

syntax enable                   "syntax highlighting
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
function! ToggleListMode() "{{{2
" Toggle through three states, ``:help digraph-table`` lists symbols
  if !&list
    set list listchars&vim showbreak&vim
  elseif &listchars==#'eol:$'
    execute s:list_settings
  else
    set nolist listchars&vim showbreak&vim
  end
endfunction "}}}2

"   Mappings and commands {{{1
"   ---------------------
"
" Functions for mappings {{{
function! Cipher() "{{{2
  if filereadable(expand('~/Documents/safe/cipher.bf'))
    edit ~/Documents/safe/cipher.bf
  else
    find safe/cipher.bf
  endif
endfunction
" }}}

if filereadable('/etc/gentoo-release') | inoremap Â£ £| endif
if has('gui') "vim sees no difference <C-v> or <C-S-v>; use <C-q> for literal
  imap <C-S-v> <C-r>+
endif
noremap Y y$
" alphabetical - `:sort i`
noremap <C-L> :noh<CR><C-L>
vnoremap <Leader>= :<C-U>call Sum()<CR>
nmap <Leader>b :call toggle#toggle_colors()<CR>
call opfunc#opfuncmap('c') " straight yank
if filereadable('/etc/gentoo-release') | set laststatus=2 | endif
noremap <Leader>fc :call Cipher()<CR>
noremap <Leader>fu :find URLs.txt<CR>
noremap <Leader>h :call rst#headings()<CR>
noremap <Leader>i :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
call opfunc#opfuncmap('j', 'jupyter') " run in jupyter
nmap <Leader>J :call jupyter#toggle()<CR>
vnoremap <Leader>k <ESC>:if line("'<") > 1 \| 0,'<-1d \| en \|
  \ if line("'>") < line('$') \| '>+1,$d \| en<CR>0gg
call opfunc#opfuncmap('l') " run in dbext
call opfunc#opfuncmap('L') " run in dbext with .mode list
noremap <Leader>m :call toggle#toggle_jobs()<CR>
noremap <Leader>n :silent!
  \ 5new +setlocal\ buftype=nofile\ bufhidden=hide\ noswapfile<CR><CR>
if has('win32')
  noremap <Leader>N :%y<CR>:silent !powershell notes.ps1<CR>
endif
noremap <Leader>/ :s,\\,/,g<CR><C-L>
if has('win32') " has('clipboard') loads an nvim provider, showing a message
  noremap <Leader>p :%d _ \| pu + \| 1d \| normal G<CR>
else
  noremap <Leader>p :%d _ \| pu " \| 1d \| normal G<CR>
endif
noremap <Leader>R :SyntasticReset<CR>
noremap <Leader>r :SyntasticToggleMode<CR>
noremap <Leader>t :call ToggleListMode()<CR>
noremap <Leader>v :set paste! paste?<CR>
noremap <Leader>w :call rst#wrap()<CR>
noremap <Leader>W :call opfunc#clipboard(rst#link())<CR>
noremap <Leader>\ :s,\\,/,g<CR>
noremap <Leader>/ :s,/,\\,g<CR>
call opfunc#opfuncmap('y')
" The two lines below prevent vim-gitgutter over-riding [c and ]c
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
command! -nargs=+ Jupyter :call jupyter#command(<q-args>)
command! GGutter :packadd gitgutter | :GitGutterEnable

"Digraphs {{{1
"--------
"
"   http://www.unicode.org/charts/charindex.html
"   http://www.cs.tut.fi/~jkorpela/dashes.html
"   Use echo 0x2026 to convert to decimal
"   3 em dashes have no space in times or arial but do in calibri
digraphs .. 8230 " ellipsis …
digraphs n- 8211 "em dash —
digraphs m- 8212 "em dash –
digraphs bu 8226 "bullet •
digraphs bb 9744 bx 9745 " ballot box ☐ and ballot box with check ☑
" vim: set foldmethod=marker :{{{1
