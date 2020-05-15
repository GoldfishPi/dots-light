
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

nnoremap <C-Home> :e ~/.config/nvim/init.vim <CR>
nnoremap <C-End> :source $HOME/.config/nvim/init.vim <CR>

"Line moving
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+2<CR>gv-gv

"Open Tickr Todo
au BufNewFile,BufRead $HOME/projects/tickr*
    \ nmap <leader>y :execute Tasks()<CR>
