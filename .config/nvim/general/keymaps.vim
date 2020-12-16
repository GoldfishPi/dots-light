
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

nnoremap <leader>u :tabnew<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

nnoremap <leader>ff :Dirvish %<CR>

nnoremap <leader>t :TestFile<CR>
nnoremap <leader>T :TestSuit<CR>

nnoremap <expr> <leader>p (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <leader>P :Rg<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>Q :wqa<CR>

nnoremap <leader>" "+
nnoremap <leader>' "+p

nnoremap <leader>G :Gstatus<CR>
nnoremap <leader>gc :BCommits<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>

nnoremap <leader>bl :Buffers<CR>
nnoremap <leader>bc :%bd<CR>

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

nmap <leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
nmap <leader>cr <cmd>lua vim.lsp.buf.references()<cr>

nmap <leader>cn <cmd>lua vim.lsp.buf.rename()<cr>

nmap <leader>ci <cmd>lua vim.lsp.buf.implementation()<cr>
nmap <leader>cd <cmd>lua vim.lsp.buf.declaration()<cr>
nmap <leader>cD <cmd>lua vim.lsp.buf.definition()<cr>
imap <silent> <c-space> <Plug>(completion_trigger)

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Line moving
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+2<CR>gv-gv

