local actions = require('telescope.actions');
local M = {};
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        file_ignore_patterns = {
            "%.png", "*.jpg", "node_modules/*", ".dist/*", ".build/*", "images/*", "*-lock"
        },
        mappings = {
            i = {
                ["<C-l>"] = "git_create_branch",
            }
        }
    },
    extensions = {
        fzf = {
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')

