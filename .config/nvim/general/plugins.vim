call plug#begin()

" -- vim util
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-dirvish'

Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

" Plug 'jiangmiao/auto-pairs'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'

Plug 'junegunn/goyo.vim'


Plug 'janko/vim-test'

" -- language server
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'alvan/vim-closetag'
Plug 'sbdchd/neoformat'

Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'


" -- Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" -- Themes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

"  90% of our syntax highlighting is done with treesitter but 
"  it's not easy to add gql or styled components because they are
"  both done with template strings which don't seem to be tracked 
"  with treesitter.
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'mustache/vim-mustache-handlebars'
Plug 'maxmellon/vim-jsx-pretty'


call plug#end()
