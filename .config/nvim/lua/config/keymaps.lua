require'mapx'.setup{ global = false }

local telescope = require 'telescope.builtin';
local ignores = require('config/telescope').file_ignores;

local  mapx = require 'mapx';
local nnoremap = mapx.nnoremap;
local inoremap = mapx.inoremap;

require'hop'.setup {keys = 'arstgmneio', extend_visual = true}


local map = vim.api.nvim_set_keymap

inoremap('ii', '<ESC>')

map('n', '<leader>n', ':NvimTreeToggle<CR>', {})

map('n', '<leader>tt', ':TestFile<CR>', {noremap = true})

map('n', '<leader>"', '"+', {noremap = true})
map('n', [[<leader>']], '"+p', {noremap = true})

map('n', '<leader>s', ':HopWord<CR>', {noremap = true, silent = true})
map('n', '<leader>l', ':HopLine<CR>', {noremap = true, silent = true})

map('i', '<C-l>', '<cmd>lua require "pears".expand()<CR>', {noremap = true, silent = true})

-- Quickfix
map('n', [[<C-j>]], ':cnext<CR>', {noremap = true, silent = true})
map('n', [[<C-k>]], ':cprev<CR>', {noremap = true, silent = true})

map('n', '<leader>qo', ':copen<CR>', {});
map('n', '<leader>qq', ':cclose<CR>', {});

-- PACKER
map('n', '<leader>pu', ':PackerUpdate<CR>', {});
map('n', '<leader>pc', ':PackerCompile<CR>', {});
map('n', '<leader>ps', ':PackerStatus<CR>', {});

-- BUFFER
map('n', '<leader>bc', '<cmd>bufdo bd<CR>', {noremap = true})

-- TABS
map('n', 'J', '<cmd>tabprevious<CR>', {noremap = true})
map('n', 'K', '<cmd>tabnext<CR>', {noremap = true})
map('n', '<leader>u', '<cmd>tabnew<CR>', {noremap = true})

-- Search
--
nnoremap('<leader>ff', function ()
    require'telescope.builtin'.find_files({
        file_ignore_patterns = vim.list_extend(ignores, {
            "__tests__"
        })
    })
end)
nnoremap('<leader>ft', function ()
    require'telescope.builtin'.find_files({
        search_dirs = {'src/__tests__/'},
    })
end)
nnoremap('<leader>fg', function ()
    require'telescope.builtin'.live_grep({
        file_ignore_patterns = vim.list_extend(ignores, {
            "__tests__"
        })
    })
end)
nnoremap('<leader>fb', function ()
    telescope.buffers({})
end)
nnoremap('<leader>fh', function ()
    telescope.help_tags({})
end)
nnoremap('<leader>fs', function ()
    telescope.grep_string({})
end)


-- GIT
map('n', '<leader>gg', '<cmd>G<CR>', {noremap = true})
map('n', '<leader>gb', '<cmd>G blame<CR>', {noremap = true})

nnoremap('<leader>gc', function ()
    telescope.git_branches({
    })
end)

nnoremap('<leader>gs', function ()
    telescope.git_status({})
end)

nnoremap('<leader>gs', function ()
    telescope.git_status({})
end)
nnoremap('<leader>gS', function ()
    telescope.git_stash({})
end)

map('n', '<leader>gr', '<cmd>G reset --hard<CR>',
    {noremap = true, silent = true})
map('n', '<leader>gf', '<cmd>G fetch<CR>', {noremap = true, silent = true})
map('n', '<leader>gd', '<cmd>G diff<CR>', {noremap = true, silent = true})
map('n', '<leader>gp', '<cmd>G pull<CR>', {noremap = true, silent = true})
map('n', '<leader>gl', '<cmd>G log<CR>', {noremap = true, silent = true})

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
