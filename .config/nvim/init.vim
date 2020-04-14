if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"vim util
Plug 'kien/ctrlp.vim'
Plug 'mboughaba/i3config.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'

"Themes
Plug 'joshdick/onedark.vim'

"Typescript
Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
" Plug 'Shougo/vimproc.vim', {'do':'make'}	

"Testing
Plug 'janko/vim-test'

"Vue Plugins
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'digitaltoad/vim-pug'

"React
" Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components'

"css
Plug 'ap/vim-css-color'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'lunaru/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'

"html
Plug 'alvan/vim-closetag'

call plug#end()
" let g:deoplete#enable_at_startup = 1

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number
set showcmd

syntax on 
" color dark-medow 
colorscheme onedark
set background=dark
set t_Co=256
set noswapfile

hi Normal ctermbg=NONE guibg=NONE

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType vue set omnifunc=htmlcomplete#CompleteTags

"Files we never want to search with ctrlP
set wildignore+=*/node_modules/*,*/build/*,*/.build/*,*/dist/*,*/.dist/*

"relative line number
set relativenumber
set rnu

let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

let mapleader = ' '
let g:lmap =  {}

imap ii <Esc>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

nnoremap <leader>t TestFile<CR>
nnoremap <leader>T TestSuit<CR>

nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>i :Ag<CR>

nnoremap <leader>q :wqa<CR>

nnoremap <leader>gs :Gstatus<CR>

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<ENTER>\<c-r>=coc#on_enter()\<CR>"

"File Auto detects
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" closetag
let g:closetag_filenames = '*.html,*.hbs,*.js,*.jsx,*.tsx'


