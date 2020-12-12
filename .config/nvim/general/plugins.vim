call plug#begin()

" -- vim util
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-dirvish'

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

"  90% of our syntax highlighting is done with treesitter but 
"  it's not easy to add gql or styled components because they are
"  both done with template strings which don't seem to be tracked 
"  with treesitter.
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

call plug#end()
