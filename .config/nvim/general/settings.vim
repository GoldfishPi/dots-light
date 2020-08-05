
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

set splitbelow
set splitright

hi Normal ctermbg=NONE guibg=NONE

"Files we never want to search with ctrlP
set wildignore+=*/node_modules/*,*/build/*,*/.build/*,*/dist/*,*/.dist/*

"relative line number
set relativenumber
set rnu

imap ii <Esc>
imap Ii <Esc>
imap iI <Esc>
let mapleader = ' '

let g:closetag_filenames = '*.html,*.hbs,*.js,*.jsx,*.tsx'

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
