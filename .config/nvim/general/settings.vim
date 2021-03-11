
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

set viewoptions=folds,cursor
set sessionoptions=folds

set foldmethod=manual

"Files we never want to search with ctrlP
set wildignore+=*/node_modules/*,*/build/*,*/.build/*,*/dist/*,*/.dist/*

"relative line number
set relativenumber
set rnu

set updatetime=400

imap ii <Esc>
imap Ii <Esc>
imap iI <Esc>
let mapleader = ' '

let g:closetag_filenames = '*.html,*.hbs,*.js,*.jsx,*.tsx'

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

let g:vue_pre_processors = ['pug', 'css', 'typescript', 'javascript']

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect

let g:fzf_layout = { 'down':'40%' }

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()

let g:fugitive_pty = 0
