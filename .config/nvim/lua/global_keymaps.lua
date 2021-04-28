local map = vim.api.nvim_set_keymap

map('i', 'ii', '<ESC>', {noremap = true})
map('i', 'iI', '<ESC>', {noremap = true})
map('i', 'Ii', '<ESC>', {noremap = true})

map('n', '<leader>n', ':NvimTreeToggle<CR>', {})

map('n', '<leader>h', ':wincmd h<CR>', {noremap = true})
map('n', '<leader>l', ':wincmd l<CR>', {noremap = true})
map('n', '<leader>j', ':wincmd j<CR>', {noremap = true})
map('n', '<leader>k', ':wincmd k<CR>', {noremap = true})

map('n', '<leader>sv', ':vsplit<CR>', {noremap = true})
map('n', '<leader>sh', ':split<CR>', {noremap = true})
map('n', '<leader>f', ':Dirvish %<CR>', {noremap = true})

map('n', '<leader>tt', ':TestFile<CR>', {noremap = true})

map('n', '<leader>w', ':w<CR>', {noremap = true})
map('n', '<leader>q', ':q<CR>', {noremap = true})
map('n', '<leader>Q', ':wqa<CR>', {noremap = true})

map('n', '<leader>"', '"+', {noremap = true})
map('n', [[<leader>']], '"+p', {noremap = true})

-- BUFFER
map('n', 'J', '<cmd>tabprevious<CR>', {noremap = true})
map('n', 'K', '<cmd>tabnext<CR>', {noremap = true})
map('n', 'Q', '<cmd>BufferClose<CR>', {noremap = true})
map('n', '<leader>bb', '<cmd>BufferPick<CR>', {noremap = true})

-- Search
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true})
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {noremap = true})
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {noremap = true})
map('n', '<leader>fr', '<cmd>Telescope branches<CR>', {noremap = true})

-- GIT
map('n', '<leader>G', '<cmd>Git<CR>', {noremap = true})
map('n', '<leader>gb', '<cmd>Gblame<CR>', {noremap = true})

-- LSP
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    {noremap = true})
map('n', '<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})

map('n', '<leader>cn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})

map('n', '<leader>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>',
    {noremap = true});

map('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
map('n', '<leader>cD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
    {noremap = true});

-- Diagnostics
map('n', '<leader>ds',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})
map('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
    {noremap = true})
map('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
    {noremap = true})

map('i', '<C-Space>', 'compe#complete()<CR>',
    {noremap = true, silent = true, expr = true})
map('i', '<CR>', "compe#confirm('<CR>')",
    {noremap = true, silent = true, expr = true})
map('i', '<C-Space>', "compe#complete('<C-e>')",
    {noremap = true, silent = true, expr = true})

