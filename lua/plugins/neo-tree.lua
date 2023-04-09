return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local icons = require("icons")
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
    require("neo-tree").setup({
      close_if_last_window = true,
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = icons.git.added, -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = icons.git.modified, -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = icons.git.removed, -- this can only be used in the git_status source
            renamed = icons.kinds.Rename, -- this can only be used in the git_status source
            -- Status type
            untracked = icons.kinds.Question,
            ignored = icons.kinds.Ignored,
            unstaged = icons.kinds.UnStage,
            staged = icons.kinds.Staged,
            conflict = icons.kinds.Conflict,
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            "dist",
            "build",
          },
        },
        follow_current_file = true,
      },
    })
  end,
}
