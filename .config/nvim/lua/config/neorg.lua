require('neorg').setup {
  load = {
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.keybinds"] = {
      config = {
        neorg_leader = " "
      },
    },
    -- ["core.concealer"] = {},
    ["core.journal"] = {
      config = {
        workspace = "work"
      }
    },
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          work = "~/notes/work",
        }
      }
    },
    ["core.integrations.telescope"] = {}
  }
}
