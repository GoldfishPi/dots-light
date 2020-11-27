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

Plug 'alvan/vim-closetag'

Plug 'janko/vim-test'

" -- language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" -- Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" -- Themes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" -- Syntax Highlighting
Plug 'digitaltoad/vim-pug'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'kern/vim-es7'
Plug 'posva/vim-vue'
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ap/vim-css-color'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'lunaru/vim-less'


call plug#end()
