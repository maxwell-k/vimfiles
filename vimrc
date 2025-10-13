" vimrc
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
" autocommands {{{1
" ------------
" This block is first, so that autocommands are defined before they are
" triggered, for example :colorscheme triggers ColorScheme.
" Use a file in ftplugin if file type related.
augroup vimrc
autocmd BufReadCmd *.tbz2 call tar#Browse(expand("<amatch>")) "Gentoo binaries
autocmd BufNewFile,BufReadPost COMMIT_EDITMSG setlocal nomodeline spell
autocmd BufNewFile,BufReadPost * call vim#Spellfile()
autocmd BufReadPost /tmp/histedit.* let $PATH .= ':/usr/local/bin'
autocmd StdInReadPost * setlocal nowrap
augroup END

" hex codes from pack/submodules/start/ayu/colors/ayu.vim
" `:sort` all of the :highlight commands below
augroup my_colorschemes
autocmd!
autocmd Colorscheme ayu
  \   highlight ColorColumn guibg=#253340
  \ | highlight CursorLine guibg=#3E4B59
  \ | highlight Folded guibg=NONE guifg=sienna
  \ | highlight NonText guifg=#F29718
  \ | highlight Normal guibg=NONE
  \ | highlight SignColumn guibg=#FFD57F
  \ | highlight SpecialKey cterm=bold guifg=#cb4b16
  \ | highlight SpellRare cterm=NONE
  \ | highlight Statement guifg=#E6B673
  \ | highlight StatusLine guibg=#828C99 guifg=#14191F
  \ | highlight StatusLineNC guibg=#3E4B59 guifg=#000000
augroup END
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
colorscheme ayu

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
set shell=/bin/zsh\ --login
set shiftwidth=2
set shortmess+=I
set showcmd
set smartcase
set softtabstop=2
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
 noremap <Leader>aq :call vim#AleQuit()<CR>
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
 noremap <Leader>i :echo synIDattr(synID(line('.'),col('.'),1),'name')<CR>
vnoremap <Leader>k <ESC>:call vim#Keep()<CR>
        "<Leader>j see ftplugin/python.vim for Jedi mappings or
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

" ALE {{{1
" ---
"
let g:ale_echo_msg_format = '%linter% says `%s`'
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 50
let g:ale_shell = '/bin/sh'
let g:ale_max_buffer_history_size = 40

" Add ~/.vim/bin to PATH, for ALE executables
call setenv('PATH', expand('~/.vim/bin') . ':' . getenv('PATH'))

let s:entries = {}
" autoload/ale/fixers/sort.vim
let s:entries['sort'] = {
\ 'function': 'ale#fixers#sort#Fix',
\ 'suggested_filetypes': ['gitignore', 'newsboat', 'spellfile'],
\ 'description': 'Sort with `sort` from PATH and LC_ALL=C',
\ }
" autoload/ale/fixers/beanformat.vim
let s:entries['beanformat'] = {
\ 'function': 'ale#fixers#beanformat#Fix',
\ 'suggested_filetypes': ['beancount'],
\ 'description': 'Format with bean-format',
\ }
" autoload/ale/fixers/cog.vim
let s:entries['cog'] = {
\ 'function': 'ale#fixers#cog#Fix',
\ 'suggested_filetypes': ['cog'],
\ 'description': 'Process with cog',
\ }
" autoload/ale/fixers/embedme.vim
let s:entries['embedme'] = {
\ 'function': 'ale#fixers#embedme#Fix',
\ 'suggested_filetypes': ['embedme'],
\ 'description': 'Embed snippets with embedme',
\ }
" autoload/ale/fixers/markdown_toc.vim
let s:entries['markdown-toc'] = {
\ 'function': 'ale#fixers#markdown_toc#Fix',
\ 'suggested_filetypes': ['markdown'],
\ 'description': 'Add a table of contents with markdown-toc',
\ }
" autoload/ale/fixers/usort.vim
let s:entries['usort'] = {
\ 'function': 'ale#fixers#usort#Fix',
\ 'suggested_filetypes': ['python'],
\ 'description': 'Sort Python imports with usort via uv',
\ }
" let s:entries[''] = {
" \ 'function': '',
" \ 'suggested_filetypes': [''],
" \ 'description': '',
" \ }
for [s:key, s:entry] in items(s:entries)
  call ale#fix#registry#Add(
    \ s:key,
    \ s:entry['function'],
    \ s:entry['suggested_filetypes'],
    \ s:entry['description']
    \ )
endfor

let g:ale_fixers = {
\ 'apkbuild': ['remove_trailing_lines', 'trim_whitespace'],
\ 'beancount': ['beanformat', 'trim_whitespace'],
\ 'bzl': ['buildifier'],
\ 'cog': ['cog'],
\ 'css': ['prettier'],
\ 'embedme': ['embedme', 'prettier'],
\ 'gitignore': ['sort'],
\ 'go': ['gofmt'],
\ 'html': ['prettier'],
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\ 'markdown': ['prettier'],
\ 'markdown-toc': ['markdown-toc', 'prettier'],
\ 'python': ['black', 'usort'],
\ 'spellfile': ['sort'],
\ 'svelte': ['prettier'],
\ 'todo': ['trim_whitespace'],
\ 'toml': ['dprint'],
\ 'typescript': ['deno'],
\ 'newsboat': ['sort'],
\ 'vim': ['remove_trailing_lines', 'trim_whitespace'],
\ 'xml': ['xmllint'],
\ 'yaml': ['prettier'],
\ 'zig': ['zigfmt'],
\ }
let g:ale_pattern_options = {}
let g:ale_pattern_options['/webpack.config.js$']
  \ = {'ale_linters_ignore': ['deno']}
" Global variables {{{1
" ----------------
"
let g:netrw_http_cmd = 'curl --verbose --location --output'

" }}}1
" vim: set foldmethod=marker foldlevel=0 :
