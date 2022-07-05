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
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'tachyons/coq_nvim', {'branch': 'bugfix/fix_nerdtree_compatiability'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'kchmck/vim-coffee-script'
Plug 'preservim/tagbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'vim-test/vim-test'
Plug 'aliou/sql-heredoc.vim'
Plug 'github/copilot.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhanberg/elixir.nvim'
Plug 'noprompt/vim-yardoc'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-dirtytalk', { 'do': ':DirtytalkUpdate' }


"
" Initialize plugin system
call plug#end()

set completeopt=menu,menuone,noselect

lua <<EOF

  local lsp = require "lspconfig"
  local coq = require "coq"

	lsp.solargraph.setup { capabilities = capabilities }
	lsp.sorbet.setup{}
	lsp.tailwindcss.setup{}
  -- lsp.typeprof.setup{}
	lsp.denols.setup {
  	on_attach = on_attach,
	  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
  }

  lsp.tsserver.setup {
	  on_attach = on_attach,
	  root_dir = lsp.util.root_pattern("package.json"),
  }

	lsp.solargraph.setup(coq.lsp_ensure_capabilities())
	vim.cmd('COQnow -s')
	require("nvim-lsp-installer").setup {}
EOF


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

" set listchars=

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


" Required for operations modifying multiple buffers like rename.
set hidden

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

set spelllang=en,programming

syntax enable
set termguicolors
colorscheme gruvbox
