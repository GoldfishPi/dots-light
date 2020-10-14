
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
let g:netrw_winsize = 20

let g:vimfiler_as_default_explorer = 1

call vimfiler#custom#profile('default', 'context', {
    \ 'safe': 0
  \ })
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_as_defaultexplorer = 1


let g:vimwiki_list = [
            \{ 'path': '~/vimwiki' },
            \{ 'path': '~/vimwiki/vim' },
            \{ 'path': '~/vimwiki/work' },
            \{ 'path': '~/vimwiki/columbia' },
            \{ 'path': '~/vimwiki/spanish' },
            \{ 'path': '~/vimwiki/projects' },
            \]
let g:vue_pre_processors = ['pug', 'css', 'typescript', 'javascript']
