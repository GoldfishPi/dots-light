
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

nnoremap <leader>u :tabnew<CR>
nnoremap <leader>o :Buffers<CR>

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

nnoremap <leader>ft :VimFilerBufferDir -explorer<CR>

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
nnoremap <leader>gc :BCommits<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>

" nmap <leader>cs :CocSearch 
" nmap <leader>cR <Plug>(coc-rename)
" nmap <leader>cd <Plug>(coc-definition)
" nmap <leader>cy <Plug>(coc-type-definition)
" nmap <leader>ci <Plug>(coc-implementation)
" nmap <leader>cr <Plug>(coc-references)
" nmap <leader>cf <Plug>(coc-fix-current)
" nmap <leader>ca <Plug>(coc-codeaction-selected)
" nmap <leader>co :CocList outline<CR>
" nmap <leader>cp :CocCommand tsserver.organizeImports<CR>

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

nmap <leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
nmap <leader>cr <cmd>lua vim.lsp.buf.references()<cr>

nmap <leader>cn <cmd>lua vim.lsp.buf.rename()<cr>

nmap <leader>ci <cmd>lua vim.lsp.buf.implementation()<cr>
nmap <leader>cd <cmd>lua vim.lsp.buf.declaration()<cr>
nmap <leader>cD <cmd>lua vim.lsp.buf.definition()<cr>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
"             \"\<C-g>u\<ENTER>\<c-r>=coc#on_enter()\<CR>"

"Line moving
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+2<CR>gv-gv

nmap <leader>y :execute OpenTasks("")<CR>

"Open Tickr Todo
au BufNewFile,BufRead $HOME/projects/tickr*
    \ nmap <leader>y :execute OpenTasks("tickr")<CR>

au BufNewFile,BufRead *.post
    \ nmap <leader>g :CocCommand post.do<CR>
