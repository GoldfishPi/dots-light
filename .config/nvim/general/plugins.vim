call plug#begin()
""vim util
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'junegunn/goyo.vim'
Plug 'digitaltoad/vim-pug'

"language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

"Themes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

"Typescript
Plug 'leafgarland/typescript-vim'
Plug 'kern/vim-es7'

Plug 'posva/vim-vue'

"graph-ql/prisma
Plug 'jparise/vim-graphql'

"Testing
Plug 'janko/vim-test'

"React
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

"css
Plug 'ap/vim-css-color'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'lunaru/vim-less'

"html
Plug 'alvan/vim-closetag'

call plug#end()
