
imap ii <Esc>
imap Ii <Esc>
imap iI <Esc>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

nnoremap <leader>u :tabnew<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

nnoremap <leader>f :Dirvish %<CR>

nnoremap <leader>tt :TestFile<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope branches<cr>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>Q :wqa<CR>

nnoremap <leader>" "+
nnoremap <leader>' "+p

nnoremap <leader>G :Git<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>

nmap <leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
nmap <leader>cr <cmd>lua vim.lsp.buf.references()<cr>

nmap <leader>cn <cmd>lua vim.lsp.buf.rename()<cr>

nmap <leader>ci <cmd>lua vim.lsp.buf.implementation()<cr>
nmap <leader>cd <cmd>lua vim.lsp.buf.definition()<cr>
nmap <leader>cD <cmd>lua vim.lsp.buf.declaration()<cr>

nmap <leader>ds <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nmap <leader>dn <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nmap <leader>dp <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"Line moving
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+2<CR>gv-gv

