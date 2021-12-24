local actions = require('telescope.actions');
local builtin = require'telescope.builtin';
local M = {};
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        file_ignore_patterns = {
            "%.png", "*.jpg", "node_modules/*", ".dist/*", ".build/*", "images/*", "__tests__", "*-lock"
        },
        mappings = {i = {["<c-CR>"] = actions.git_create_branch}}
    },
    extensions = {
        fzf = {
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case"
        }
    }
}

function _G.find_tests()
    builtin.find_files {
        file_ignore_patterns = {},
        winblend = 5,
        border = true,
        search_dirs = {'src/__tests__'},
    }
end
require('telescope').load_extension('fzf')

