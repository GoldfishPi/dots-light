local M = {};
M.file_ignores = {
  "%.png",
  "*.jpg",
  "node_modules/*",
  ".dist/*",
  ".build/*",
  "images/*",
  "*-lock",
  "%.woff",
  "%.woff2",
  "vnd/*",
  "public/*",
}
M.setup = function()
  require('telescope').setup {
    defaults = {
      file_sorter = require('telescope.sorters').get_fzy_sorter,
      file_ignore_patterns = M.file_ignores,
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
    },

    pickers = {
      find_files = {
        previewer = false,
      },
      buffers = {
        show_all_buffers = true,
        sort_lastused = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
          },
          n = {
            ["<c-d>"] = "delete_buffer",
          }
        }
      }
    }

  }

  require('telescope').load_extension('fzf')
  require('telescope').load_extension('projects')
end

return M
