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
map('n', '<leader>u', '<cmd>tabnew<CR>', {noremap = true})

-- Search
map('n', '<leader>ff',
    [[:lua require('telescope.builtin').find_files({previewer = false, width = 0.2})<CR>]],
    {noremap = true})
map('n', '<leader>fg',
    [[:lua require('telescope.builtin').live_grep({previewer = false, width = 0.2})<CR>]],
    {noremap = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {noremap = true})
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {noremap = true})
map('n', '<leader>fr', '<cmd>Telescope branches<CR>', {noremap = true})

-- GIT
map('n', '<leader>gg', '<cmd>Git<CR>', {noremap = true})
map('n', '<leader>gb', '<cmd>Git blame<CR>', {noremap = true})
map('n', '<leader>gc', '<cmd>Telescope git_branches<CR>', {noremap = true})
map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', {noremap = true})
map('n', '<leader>gr', '<cmd>Git reset --hard<CR>',
    {noremap = true, silent = true})
map('n', '<leader>gf', '<cmd>Git fetch<CR>', {noremap = true, silent = true})
map('n', '<leader>gd', '<cmd>Gdiff<CR>', {noremap = true, silent = true})
map('n', '<leader>gp', '<cmd>Git pull<CR>', {noremap = true, silent = true})
map('n', '<leader>gl', '<cmd>Git log<CR>', {noremap = true, silent = true})

-- LSP
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    {noremap = true})
map('n', '<leader>cr', '<cmd>Telescope lsp_references<CR>', {noremap = true})

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

