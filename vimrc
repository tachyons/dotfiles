call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'sickill/vim-monokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/vcscommand.vim'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'janko-m/vim-test'
Plug 'ngmy/vim-rubocop'
Plug 'noprompt/vim-yardoc'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'tomtom/tcomment_vim'
Plug 'mileszs/ack.vim'
Plug 'suan/vim-instant-markdown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/dbext.vim'
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'thoughtbot/vim-rspec'
Plug 'nathanaelkane/vim-indent-guides'

"Zeal
Plug 'KabbAmine/zeavim.vim', {'on': [
            \   'Zeavim', 'Docset',
            \   '<Plug>Zeavim',
            \   '<Plug>ZVVisSelection',
            \   '<Plug>ZVKeyDocset',
            \   '<Plug>ZVMotion'
            \ ]}


"Plug 'ryanoasis/vim-devicons'
"
" " Add plugins to &runtimepath
"
Plug 'majutsushi/tagbar'
call plug#end()
syntax enable
colorscheme monokai
set shiftwidth=2
set ts=2
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

" Indentation
filetype indent on
set filetype=html          
set smartindent             
" Ctags
set tags=./tags;
let g:ackprg = 'ag --vimgrep'

" Status bar
set laststatus=2                  " always show status bar

" Status Line
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

set list listchars=tab:»·,trail:· " show extra space characters
" map git commands
map <leader>gb :Gblame<cr>
map <leader>gl :!clear && git log -p %<cr>
map <leader>gd :!clear && git diff %<cr>

" add :Plain command for converting text to plaintext
command! Plain execute "%s/'/'/ge | %s/["”]/\"/ge | %s/-/-/ge"
"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
nnoremap <leader>b :CtrlPBuffer<cr>

" Syntatic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" 100 chars per line
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Tagbar
nmap <F8> :TagbarToggle<CR>
