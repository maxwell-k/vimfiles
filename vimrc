" --------------------
" vimrc, Keith Maxwell
" --------------------
"
" Fundamental configuration {{{1
" -------------------------
"
set encoding=utf-8 viminfo='20,<50,h
scriptencoding utf-8
packloadall
autocmd!
" The two lines below ensure ftdetect files are loaded despite system settings
" http://vim.1045645.n5.nabble.com/Issues-with-ftdetect-td1193595.html
filetype off | filetype on 
filetype plugin off | filetype plugin on
syntax enable

" Options {{{1
" -------
"
" Alphabetical, "scripted" settings last
set autoindent
set backspace=indent,eol,start " backspace deletes special characters
set colorcolumn=80
set confirm " prompt before discarding changes
set expandtab
set formatlistpat=^\\s*[0-9-#•]\\+[.\ ]\\s*\\\|^\\s*[a-z]\\.\\s
set formatoptions+=n " format lists
set guioptions+=c " keyboard workaround for file changed dialog
set guioptions-=L " no scrollbar
set guioptions-=T " no toolbar
set guioptions-=m " no menu
set guioptions-=r " no scrollbar
set history=200
set hlsearch
set ignorecase " case insensitive searches
set isfname+=& " for web addresses
set isfname+=? " for web addresses
set isfname-=\= "complete e.g. home=/home/liveuser
set keywordprg= " use `K` for `:help`
set linebreak " do not wrap in the middle of a word
set mouse= " disable the mouse
set modeline " unset in /etc/vim/vimrc by Alpine Linux
set nojoinspaces " one space between sentences
set noshiftround
set nostartofline " don't move to start of line with H, M, L…
set nrformats+=alpha " increment a to b
set nrformats-=octal " increment 07 to 08 and not 010
set path+=** " recursively search, misses hidden files e.g. /.vim/
set ruler " show position
set shiftwidth=2
set shortmess+=I
set showcmd
set smartcase
set spellfile=~/.vim/spell/en.utf-8.add,./.en.utf-8.add
set softtabstop=2
set splitbelow
set termguicolors
set wildmenu
let s:list_settings = 'set list showbreak=→ '
let s:list_settings .= 'listchars=trail:←,tab:→—,extends:▓,precedes:▓'
execute s:list_settings

" Mappings {{{1
" --------
"
" Alphabetical
" <Leader>` see vim/ftplugin/rst.vim
noremap <Leader>a :call ale#quit#Mapping()<CR>
noremap <Leader>b :call toggle#toggle_colors()<CR>
call opfunc#opfuncmap('c') " straight yank
noremap <Leader>C :call SendViaOSC52(join(getline(1,'$'),'\n'))<CR>
noremap <Leader>fc :call vim#cipher()<CR>
noremap <Leader>fo :edit ~/other.txt<CR>:$-1<CR>
noremap <Leader>fr :edit ~/.sd/planning/I_have_not_read.txt<CR>
noremap <Leader>fw :edit ~/.sd/planning/I_have_not_watched.txt<CR>
noremap <Leader>fe
  \ :edit ~/.sd/planning/Housekeeping/Emails.txt<CR>:$<CR>zozz0Wy$kk
" <Leader>h see vim/ftplugin/rst.vim
noremap <Leader>i :echo synIDattr(synID(line('.'),col('.'),1),'name')<CR>
call opfunc#opfuncmap('j', 'jupyter') " run in jupyter
nmap <Leader>J :call jupyter#toggle()<CR>
vnoremap <Leader>k <ESC>:if line("'<") > 1 \| 0,'<-1d \| en \|
  \ if line("'>") < line('$') \| '>+1,$d \| en<CR>0gg
" <leader>l see plugin/dbext.vim
" <leader>L see plugin/dbext.vim
noremap <C-L> :noh<CR><C-L>
" <leader>m see plugin/dbext.vim
noremap <Leader>n :silent!
  \ 5new +setlocal\ buftype=nofile\ bufhidden=hide\ noswapfile<CR><CR>
noremap <Leader>s :call vim#scriptnames()<CR>
execute "noremap <Leader>t :silent! call vim#toggleListMode('"
  \.s:list_settings."')<CR>"
noremap <Leader>v :set paste! paste?<CR>
noremap <Leader>w :call rst#wrap()<CR>
noremap <Leader>W :call opfunc#clipboard(rst#link())<CR>
call opfunc#opfuncmap('y')
noremap Y y$
vnoremap <Leader>= :<C-U>call vim#sum()<CR>
nmap <Leader>` <Plug>(interpreted_text)
noremap <Leader>\ :s,\\,/,g<CR>
noremap <Leader>/ :s,/,\\,g<CR>

" Commands {{{1
" --------
"
command! -nargs=+ Jupyter :call jupyter#command(<q-args>)
command! GGutter :packadd gitgutter | :GitGutterEnable

" Digraphs {{{1
" --------
"
" Alphanbetical, see http://www.unicode.org/charts/charindex.html for more and
" use ``:echo 0x2026`` to convert to decimal
digraphs .. 8230 " ellipsis …
digraphs bb 9744 " ballot box ☐
digraphs bu 8226 " bullet •
digraphs bx 9745 " ballot box with check ☑
digraphs m- 8212 " em dash –
digraphs n- 8211 " em dash —
digraphs %< 9986 " black scissors ✂

" autocommands {{{1
" ------------
"
" Use a file in ftplugin if file-type related
augroup vimrc
autocmd BufReadCmd *.tbz2 call tar#Browse(expand("<amatch>")) "Gentoo binaries
autocmd BufRead COMMIT_EDITMSG setlocal nomodeline spell
autocmd StdInReadPost * setlocal nowrap
augroup END

" Plugin, syntax and highlighting configuration {{{1
" ---------------------------------------------
"
colorscheme mine
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 50
let g:ale_sh_shellcheck_options = '-x'
let g:is_posix = 1  " $() isn't an error in sh
" The two lines below prevent vim-gitgutter over-riding [c and ]c
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
