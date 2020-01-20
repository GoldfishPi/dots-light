if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number
set showcmd

call plug#begin()
"vim util
Plug 'aserebryakov/vim-todo-lists'
Plug 'kien/ctrlp.vim'
Plug 'mboughaba/i3config.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'hecal3/vim-leader-guide'

"Themes
Plug 'joshdick/onedark.vim'

"Javascript
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'

"Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do':'make'}

Plug 'Galooshi/vim-import-js'
Plug 'digitaltoad/vim-pug'

"Testing
Plug 'janko/vim-test'

"Vue Plugins
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'digitaltoad/vim-pug'

"React
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'peitalin/vim-jsx-typescript'

"css
Plug 'ap/vim-css-color'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'lunaru/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'

"Rust
Plug 'cespare/vim-toml'

"Python
Plug 'vim-python/python-syntax'

"GraphQl
Plug 'jparise/vim-graphql'

"Trello
Plug 'malithsen/trello-vim'

call plug#end()
"let g:deoplete#enable_at_startup = 1

syntax on 
color onedark 
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

let g:lmap.q = ['q', 'Quit']
let g:lmap.f = { 'name' : 'Find' }
let g:lmap.f.f = ['CtrlP', 'File']
let g:lmap.f.n = ['NERDTreeFind', 'Find in tree']

let g:lmap.s = { 'name' : 'Search' }
let g:lmap.s.p = ['Ag', 'Project']

let g:lmap.w = { 'name' : 'Window' }
let g:lmap.w.q = ['q', 'close']
let g:lmap.w.s = { 'name':'Split' }
let g:lmap.w.s.h = ['sv', 'v-split']
let g:lmap.w.s.v = ['vsplit', 'h-split']

let g:lmap.t = { 'name' : 'Toggle' }
let g:lmap.t.n = ['NERDTreeToggle', 'NERDTree']

let g:lmap.c = { 'name' : 'Code' }
let g:lmap.c.i = ['TsuImport', 'Import']
let g:lmap.c.r = ['TsuRenameSymbol', 'Rename']
let g:lmap.c.d = ['TsuDefinition', 'Definition']

let g:lmap.c.t = { 'name' : 'Test' }
let g:lmap.c.t.f = ['TestFile', 'File']
let g:lmap.c.t.s = ['TestSuit', 'Suite']

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide ' '<CR>

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()

"File Auto detects
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

