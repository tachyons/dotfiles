call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'dracula/vim'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'deoplete-plugins/deoplete-lsp'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'kchmck/vim-coffee-script'
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/tagbar'
"
" Initialize plugin system
call plug#end()


let g:deoplete#enable_at_startup = 1

" Rails vim
let g:rails_projections = {
      \ "app/services/*.rb": {
      \   "command": "service",
      \   "template": "class {camelcase|capitalize|colons}\nend",
      \   "test": [
      \     "spec/services/{}_spec.rb"
      \   ]
      \ }
      \}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'ruby': ['rubocop'],
\   'python': ['autopep8', 'yapf']
\}

"
 let g:ale_linters = {'ruby': ['rubocop'] }

 " Set leader key as ,
let mapleader = ","

set list listchars=tab:¬ª¬∑,trail:¬∑ " show extra space characters

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

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed


" map git commands
map <leader>gb :Git blame<cr>
map <leader>gl :!clear && git log -p %<cr>
map <leader>gd :!clear && git diff %<cr>


map <leader>b :History<cr>
map <leader>p :GFiles<cr>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" Required for operations modifying multiple buffers like rename.
set hidden

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

syntax enable
colorscheme gruvbox
