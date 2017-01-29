" General {{{
set nocompatible
filetype plugin indent on
syntax enable

set autoread
set modelines=1
set encoding=utf-8
set scrolloff=3
set hidden
set ttyfast
set backspace=indent,eol,start
set visualbell
set noerrorbells
set nrformats= " treat all numbers as decimals
set number
set cursorline
set statusline+=%m
set laststatus=2 " always show the statusline
set showcmd
set showmode
set clipboard=unnamed
set showmatch " show matching parentheses
set nofoldenable " unfolded by default
set mouse=a

let mapleader = "\<Space>"

runtime macros/matchit.vim
" }}}

" Plugins {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/BufOnly.vim'

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabLongestHighlight = 1

Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

Plugin 'jelera/vim-javascript-syntax'
autocmd FileType javascript call JavaScriptFold()

Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'danro/rename.vim'

Plugin 'derekwyatt/vim-scala'

Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
Plugin 'tpope/vim-fireplace'
au Filetype clojure nmap <c-c><c-k> :Require<cr>
Plugin 'vim-scripts/paredit.vim'
Plugin 'venantius/vim-cljfmt'
" }}}

" Colors {{{
set background=dark
colorscheme solarized
highlight clear SignColumn
" }}}

" Indentation settings {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
" }}}

" Line wrapping {{{
" setlocal formatoptions=ant
" setlocal textwidth=80
" setlocal wrapmargin=0
" set textwidth=79
set wrap
set linebreak
set nolist
set whichwrap+=<,>,h,l,[,] " set arrow keys to wrap around lines
" }}}

" Search settings {{{
" use more standard regex syntax by inserting \v to regexes
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault  " use global search by default (g in s/search/replace/g)
set incsearch
set showmatch
set hlsearch
" }}}

" Code completion {{{
" automatically choose the longest common prefix of all the suggestions
set completeopt=menu,longest,preview
set pumheight=10  " limit popup menu height

" show autocomplete menus
set wildmenu
set wildmode=list:longest,full
" }}}

" Backup and viminfo {{{
" set viminfo='10,\"100,:100,n~/.vim/viminfo

set backupdir=~/.vim/vim-tmp
set backupcopy=yes
set nobackup

set directory=~/.vim/vim-tmp
set noswapfile

set undodir=~/.vim/vim-tmp
set undofile
set undolevels=1000
" }}}

" Key mappings {{{
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <Insert> <nop>
inoremap <Del> <nop>
inoremap <Home> <nop>
inoremap <End> <nop>
inoremap <PageUp> <nop>
inoremap <PageDown> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap <Insert> <nop>
noremap <Del> <nop>
noremap <Home> <nop>
noremap <End> <nop>
noremap <PageUp> <nop>
noremap <PageDown> <nop>

" map & to &&: repeat last substitute command with flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" key to disable highlighting of searched words
nnoremap <silent> <leader>l :<C-u>nohlsearch<CR><C-l>

" shortcuts to toggle different types of line numbering
nnoremap <leader>n :setl nu!<CR>
nnoremap <leader>r :setl rnu!<CR>

" close other buffers and windows
nnoremap <leader>o :BufOnly<CR><C-w>o<CR>

" switch between most recent buffers
nnoremap <leader>t :b#<CR>

" close current buffer
nnoremap <leader>d :bdelete<CR>

" write current buffer
nnoremap <leader>w :write<CR>
" }}}

" GUI options {{{
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions+=c  " show normal vim alerts instead of modal windows

    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ for\ Powerline\ 22
        " http://gniourf-gniourf.blogspot.fr/2011/11/true-full-screen-for-gvim.html
        function! ToggleFullScreen()
            call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
            redraw
        endfunction
        nnoremap <M-f> :call ToggleFullScreen()<CR>
        inoremap <M-f> <C-\><C-O>:call ToggleFullScreen()<CR>
    elseif has("gui_macvim")
        highlight visual term=reverse cterm=reverse guibg=MacSelectedTextBackgroundColor
        highlight cursor guifg=bg guibg=LightGoldenRod
        set guifont=Source\ Code\ Pro\ for\ Powerline:h18
        set transparency=10
    endif
endif
" }}}

" Custom functions, autogroups, etc. {{{
" restore cursor position for reopened files
function! ResCur()
        if line("'\"") <= line("$")
                normal! g`"
                return 1
        endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

if has('autocmd')
    " skeleton files for different file formats
    autocmd BufNewFile *.xml 0r ~/.vim/skeletons/skeleton.xml | let IndentStyle = "xml"
    autocmd BufNewFile *.html 0r ~/.vim/skeletons/skeleton.html | let IndentStyle = "html"
    autocmd BufNewFile *.py 0r ~/.vim/skeletons/skeleton.py | let IndentStyle = "py"
    autocmd BufNewFile *.js 0r ~/.vim/skeletons/skeleton.js | let IndentStyle = "js"
    autocmd BufNewFile *.css 0r ~/.vim/skeletons/skeleton.css | let IndentStyle = "css"

    " prevent line numbers etc. from appearing in quickfix window and others
    function SetVimFiletypeOptions()
        setlocal nonumber
        setlocal colorcolumn=
        setlocal noruler
        setlocal norelativenumber
        setlocal nocursorline
        setlocal nocursorcolumn
    endfunction
    autocmd Filetype vim call SetVimFiletypeOptions()
    autocmd Filetype qf call SetVimFiletypeOptions()

    autocmd BufRead,BufNewFile *.scala set filetype=scala
endif
" }}}

" vim:foldmethod=marker:foldenable:foldlevel=0
