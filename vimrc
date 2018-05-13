" --------------------
" vimrc, Keith Maxwell
" --------------------
"
set encoding=utf-8 viminfo='20,<50,h
scriptencoding utf-8

" File types, plugins and runtimepath {{{1
" -----------------------------------
execute 'set runtimepath^='.expand('<sfile>:p:h').'/runtimepath'
execute 'set runtimepath+='.expand('<sfile>:p:h').'/runtimepath/after'
"http://vim.1045645.n5.nabble.com/Issues-with-ftdetect-td1193595.html
filetype off | filetype on
filetype plugin off | filetype plugin on "load plugins

" Plugin options in global variables {{{2
" ----------------------------------
"
let g:ale_fix_on_save = 1
let g:ale_sh_shellcheck_options = '-x'
let g:markdown_folding=1

"Editing and movement {{{1
"--------------------
"
set backspace=indent,eol,start  " backspace deletes special characters
set confirm                     "prompt before discarding changes
set formatlistpat=^\\s*[0-9-#•]\\+[.\ ]\\s*\\\|^\\s*[a-z]\\.\\s
set formatoptions+=n            " format lists
set history=200
set ignorecase                  " case insensitive searches
set keywordprg=                 "use `K` for `:help`
set linebreak                   " do not wrap in the middle of a word
set mouse=                      " disable the mouse
set nojoinspaces                " one space between sentences
set nostartofline               " don't move to start of line with H, M, L…
set nrformats+=alpha            " increment a to b
set nrformats-=octal            " increment 07 to 08 and not 010
set shortmess+=I
set smartcase                   " override ignorecase if upper case characters
set wildmenu                    "normal mode tab completion menu

"File name options for :find etc. {{{2
"--------------------------------
"
" Doesn't search dotfiles like /.vim/
set path+=**                    "recursively search below files directory
set isfname+=?                  "for web addresses
set isfname+=&                  "for web addresses
"Tabs {{{2
"----
"
set expandtab
set shiftwidth=4
set noshiftround
set softtabstop=4               "backspace removes an expanded tab
set autoindent

" autocommands {{{1
" ------------
"
autocmd!
" Move  below to a file in ftplugin if more that one line per file-type:
augroup vimrc
autocmd FileType dosini set isfname-=\= "complete e.g. home=/home/liveuser
autocmd BufReadCmd *.tbz2 call tar#Browse(expand("<amatch>")) "Gentoo binaries
autocmd BufRead COMMIT_EDITMSG setlocal nomodeline | setlocal spell
autocmd StdInReadPost * setlocal nowrap
augroup END

" Display {{{1
" -------
set colorcolumn=80
set guioptions+=c  " keyboard workaround for file changed dialog
set guioptions-=L  " no scrollbar
set guioptions-=T  " no toolbar
set guioptions-=m  " no menu
set guioptions-=r  " no scrollbar
set hlsearch
set ruler          "show position
set showcmd
set splitbelow
set termguicolors
let s:list_settings = 'set list showbreak=→ '
let s:list_settings .= 'listchars=trail:←,tab:→—,extends:▓,precedes:▓'
execute s:list_settings
colorscheme ayu

syntax enable                   "syntax highlighting
"   Mappings and commands {{{1
"   ---------------------
"

noremap Y y$
" alphabetical - `:sort i`
noremap <C-L> :noh<CR><C-L>
vnoremap <Leader>= :<C-U>call vim#sum()<CR>
call opfunc#opfuncmap('c') " straight yank
noremap <Leader>C :call SendViaOSC52(join(getline(1,'$'),"\n"))<CR>
noremap <Leader>fc :call vim#cipher()<CR>
noremap <Leader>fo :edit ~/other.txt<CR>:$-1<CR>zozz
noremap <Leader>fe
  \ :edit ~/.sd/planning/Housekeeping/Emails.txt<CR>:$<CR>zozz0Wy$kk
" <Leader>h see runtimepath/ftplugin/rst.vim
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
noremap <Leader>/ :s,\\,/,g<CR><C-L>
noremap <Leader>s :call vim#scriptnames()<CR>
execute "noremap <Leader>t :silent! call vim#toggleListMode('"
  \.s:list_settings."')<CR>"
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
