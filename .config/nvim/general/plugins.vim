call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'justinmk/vim-dirvish'

Plug 'mhinz/vim-startify'

Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'

Plug 'junegunn/goyo.vim'

Plug 'janko/vim-test'

" -- language server
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'alvan/vim-closetag'
Plug 'lukas-reineke/format.nvim'

Plug 'hrsh7th/nvim-compe'

" -- Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" -- Themes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

"  90% of our syntax highlighting is done with treesitter but 
"  it's not easy to add gql or styled components because they are
"  both done with template strings which don't seem to be tracked 
"  with treesitter.
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'maxmellon/vim-jsx-pretty'


call plug#end()
