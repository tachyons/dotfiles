call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'sickill/vim-monokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/vcscommand.vim'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'terryma/vim-multiple-cursors'
"Plug 'ryanoasis/vim-devicons'
"
" " Add plugins to &runtimepath
call plug#end()
syntax enable
colorscheme monokai
set shiftwidth=2
set expandtab
let g:airline#extensions#tabline#enabled = 1
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set nocompatible
set hidden

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
 set undodir=~/.vim/undo
endif

" Enable line numbers
set number

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Local config
if filereadable($HOME . "/.vimrc.local")
 source ~/.vimrc.local
endif
