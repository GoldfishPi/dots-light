
call plug#begin()
"vim util

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'

"Themes
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mboughaba/i3config.vim'

"Typescript
Plug 'leafgarland/typescript-vim'

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

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number
set showcmd

syntax on 
colorscheme onedark
set t_Co=256
set termguicolors
set noswapfile

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

set splitbelow
set splitright

hi Normal ctermbg=NONE guibg=NONE

"Files we never want to search with ctrlP
set wildignore+=*/node_modules/*,*/build/*,*/.build/*,*/dist/*,*/.dist/*

"relative line number
set relativenumber
set rnu

imap ii <Esc>
let mapleader = ' '

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

nnoremap <leader>u :tabnew<CR>
nnoremap <leader>o :Buffers<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

nnoremap <leader>n :CocCommand explorer<CR>

nnoremap <leader>t :TestFile<CR>
nnoremap <leader>T :TestSuit<CR>

nnoremap <leader>p :GFiles<CR>
nnoremap <leader>P :Rg<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>Q :wqa<CR>

nnoremap <leader>" "+
nnoremap <leader>' "+p

nnoremap <leader>G :Gstatus<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
            \"\<C-g>u\<ENTER>\<c-r>=coc#on_enter()\<CR>"

"Line moving
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+2<CR>gv-gv

autocmd bufwritepost *.[tj]s silent :CocCommand eslint.executeAutofix

"File Auto detects
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

au BufNewFile,BufRead *.prisma setfiletype graphql

" closetag
let g:closetag_filenames = '*.html,*.hbs,*.js,*.jsx,*.tsx'

