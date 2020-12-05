call plug#begin()

" -- vim util
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'junegunn/goyo.vim'


Plug 'janko/vim-test'

" -- language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'alvan/vim-closetag'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'


" -- Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" -- Themes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

call plug#end()
