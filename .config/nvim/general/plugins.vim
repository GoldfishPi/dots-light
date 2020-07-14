call plug#begin()
""vim util
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'

Plug 'mhinz/vim-signify'

"Themes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

"Typescript
Plug 'leafgarland/typescript-vim'
Plug 'kern/vim-es7'

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
