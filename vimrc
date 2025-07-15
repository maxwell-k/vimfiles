" vimrc
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
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
colorscheme mine

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
set grepprg=git\ grep\ -n
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
set omnifunc=ale#completion#OmniFunc
set path+=** " recursively search, misses hidden files e.g. /.vim/
set ruler " show position
set runtimepath-=/usr/share/vim/vimfiles/after  " so `:helptags all` succeeds
set shell=/bin/zsh\ -l
set shiftwidth=2
set shortmess+=I
set showcmd
set smartcase
set softtabstop=2
set spellfile=~/.vim/spell/en.utf-8.add " second file in autocommand below
set splitbelow
set termguicolors
set wildmenu
" See help xterm-true-color
if $TERM !~# 'xterm*'
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif
" override /etc/vimrc on Fedora
set incsearch& scrolloff&

" Scripted options
let s:list_settings = 'setlocal list showbreak=→ '
let s:list_settings .= 'listchars='
let s:list_settings .= 'trail:←,tab:→—,extends:▓,precedes:▓'
execute s:list_settings
execute "noremap <Leader>l :call toggle#List('".s:list_settings."')<CR>"
unlet s:list_settings

" Mappings and commands {{{1
" ---------------------
"
" Using <Leader>, alphabetically:
 noremap <Leader>aq :call ale#quit#Mapping()<CR>
 noremap <Leader>aD :call toggle#Ale()<CR>
     map <Leader>af <Plug>(ale_find_references)
     map <Leader>ad <Plug>(ale_go_to_definition)
     map <Leader>ah <Plug>(ale_hover)
     map <Leader>ar <Plug>(ale_rename)
     map <Leader>at <Plug>(ale_go_to_type_definition)
        "<Leader>b see pack/vendored/start/backlog/plugin/mappings.vim
call opfunc#opfuncmap('c') " straight yank
 noremap <Leader>C :call toggle#Colors()<CR>
 noremap <Leader>fF :call SendViaOSC52(@%)<CR>
 noremap <Leader>ff :call vim#YankPathWithTilde()<CR>
        "<Leader>g see plugin/mappings.vim
        "<Leader>h see vim/ftplugin/rst.vim
 noremap <Leader>i :echo synIDattr(synID(line('.'),col('.'),1),'name')<CR>
vnoremap <Leader>k <ESC>:call vim#Keep()<CR>
        "<Leader>j see ftplugin/python.vim for Jedi mappings or
        "<Leader>j see plugin/jupyter.vim in the jupyter package
        "<Leader>J see plugin/jupyter.vim in the jupyter package
        "<Leader>l see above
 noremap <Leader>m :/<<<<<<<\\|=======\\|>>>>>>><CR>
        "<Leader>p? see ftplugin/python.vim
 noremap <Leader>s :call toggle#Shiftwidth()<CR>
 noremap <Leader>S :call vim#Scriptnames()<CR>
        "        t see ftplugin/todo.vim
 noremap <Leader>v :set paste! paste?<CR>
call opfunc#opfuncmap('y')
 noremap <Leader>w <C-w>
 noremap <Leader>zg :call fzf#run(fzf#wrap({'source': 'git ls-files'}))<CR>
 noremap <Leader>zs :call fzf#CustomGitStatus()<CR>
vnoremap <Leader>= :<C-U>call vim#Sum()<CR>
 noremap <Leader>\ :s,\\,/,g<CR>
 noremap <Leader>/ :s,/,\\,g<CR>
 noremap <Leader><CR> :call vim#Browser()<CR>
" Other:
 noremap <C-L> :nohlsearch<CR><C-L>
 noremap Y y$

command! W ALEFix!|w|silent execute '!git add %'|redraw!
command! C call SendViaOSC52(join(getline(1,'$'),"\n"))

" Digraphs {{{1
" --------
"
" Alphanbetical, see http://www.unicode.org/charts/charindex.html for more and
" use ``:echo 0x2026`` to convert to decimal
digraphs .. 8230 " ellipsis …
digraphs bu 8226 " bullet •
digraphs m- 8212 " em dash –
digraphs n- 8211 " em dash —
digraphs %< 9986 " black scissors ✂
digraphs fl 9873 " black flag ⚑
digraphs am 128126 " alien monster 👾
digraphs bb 128499 " ballot box with ballot 🗳
digraphs mi 129704 " rock 129704 🪨
" other digraphs I use: ·

" autocommands {{{1
" ------------
"
" Use a file in ftplugin if file-type related
augroup vimrc
autocmd BufReadCmd *.tbz2 call tar#Browse(expand("<amatch>")) "Gentoo binaries
autocmd BufNewFile,BufReadPost COMMIT_EDITMSG setlocal nomodeline spell
autocmd BufNewFile,BufReadPost * call vim#Spellfile()
autocmd BufReadPost /tmp/histedit.* let $PATH .= ':/usr/local/bin'
autocmd StdInReadPost * setlocal nowrap
augroup END

" Global variables {{{1
" ----------------
"
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '%linter% says `%s`'
let g:ale_lint_delay = 50
let g:ale_shell='/bin/sh'
let g:is_posix = 1  " $() isn't an error in sh
let g:netrw_http_cmd = 'curl --verbose --location --output'

" vim: set foldmethod=marker foldlevel=0 :
