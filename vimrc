" --------------------
" vimrc, Keith Maxwell
" --------------------
"
" Fundamental configuration {{{1
" -------------------------
"
set encoding=utf-8 viminfo='20,<50,h
scriptencoding utf-8
autocmd!
" The two lines below ensure ftdetect files are loaded despite system settings
" http://vim.1045645.n5.nabble.com/Issues-with-ftdetect-td1193595.html
filetype off | filetype on
filetype plugin off | filetype plugin on
syntax enable

" Options {{{1
" -------
"
" Alphabetical hard-coded options
set autoindent
set backspace=indent,eol,start " backspace deletes special characters
set backup " to avoid loosing file conents after an inadvertent :.wq then Y
set backupdir=~/.backupdir,.
set colorcolumn=80
set confirm " prompt before discarding changes
set expandtab
set foldlevelstart=99
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
set modeline " unset in /etc/vim/vimrc by Alpine Linux
set mouse= " disable the mouse
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
set softtabstop=2
set spellfile=~/.vim/spell/en.utf-8.add " second file in autocommand below
set splitbelow
set termguicolors
set wildmenu

" Scripted options
let s:list_settings = 'set list showbreak=→ ' " also used in a mapping below
let s:list_settings .= 'listchars='
let s:list_settings .= 'trail:←,tab:→—,extends:▓,precedes:▓'
execute s:list_settings

" Mappings {{{1
" --------
"
" Alphabetical
 noremap <Leader>aq :call ale#quit#Mapping()<CR>
 noremap <Leader>ad :unlet! b:ale_fixers \| ALEDisableBuffer<CR>
 noremap <Leader>b :call toggle#toggle_colors()<CR>
call opfunc#opfuncmap('c') " straight yank
 noremap <Leader>C :call SendViaOSC52(join(getline(1,'$'),'\n'))<CR>
        "<Leader>g see plugin/mappings.vim
        "<Leader>h see vim/ftplugin/rst.vim
 noremap <Leader>i :echo synIDattr(synID(line('.'),col('.'),1),'name')<CR>
vnoremap <Leader>k <ESC>:call vim#keep()<CR>
        "<Leader>j see ftplugin/python.vim for Jedi mappings or
        "<Leader>j see plugin/jupyter.vim in the jupyter package
        "<Leader>J see plugin/jupyter.vim in the jupyter package
        "<Leader>l see vim/plugin/dbext.vim
        "<Leader>L see vim/plugin/dbext.vim
 noremap <C-L> :noh<CR><C-L>
        "<Leader>m see vim/plugin/dbext.vim
 noremap <Leader>n :call vim#new()<CR>
 noremap <Leader>S :call vim#scriptnames()<CR>
execute "noremap <Leader>t :call toggle#toggle_list('".s:list_settings."')<CR>"
 noremap <Leader>v :set paste! paste?<CR>
 noremap <Leader>zg :call fzf#run(fzf#wrap({'source': 'git ls-files'}))<CR>
 noremap <Leader>zs :call fzf#custom_git_status()<CR>
call opfunc#opfuncmap('y')
 noremap Y y$
vnoremap <Leader>= :<C-U>call vim#sum()<CR>
 noremap <Leader>\ :s,\\,/,g<CR>
 noremap <Leader>/ :s,/,\\,g<CR>

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
autocmd BufNewFile example.yaml 0r ~/.vim/example.yaml | normal Gddf:ll
autocmd BufReadCmd *.tbz2 call tar#Browse(expand("<amatch>")) "Gentoo binaries
autocmd BufNewFile,BufReadPost COMMIT_EDITMSG setlocal nomodeline spell
autocmd BufNewFile,BufReadPost * execute 'setlocal spellfile+='
  \ . fnamemodify(resolve(bufname('%')), ':h').'/.en.utf-8.add'
autocmd BufReadPost /tmp/histedit.* let $PATH .= ':/usr/local/bin'
autocmd StdInReadPost * setlocal nowrap
augroup END

" Plugin, syntax and highlighting configuration {{{1
" ---------------------------------------------
"
colorscheme ayu " to search below pack/*/start & avoid calling packloadall
colorscheme mine
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 50
let g:ale_sh_shellcheck_options = '-x'
let g:is_posix = 1  " $() isn't an error in sh

" Workaround for vim without patch 8.1.0353 {{{1
" -----------------------------------------
"
" https://github.com/vim/vim/issues/3409
" https://github.com/vim/vim/commit/99396d4cbf78d313a454c7448acc07412d2e45b7
if v:version < 801
  packloadall
  set runtimepath-=~/.vim/after
  set runtimepath+=~/.vim/after
endif
"}}}1

" vim: set foldmethod=marker foldlevel=0 :
