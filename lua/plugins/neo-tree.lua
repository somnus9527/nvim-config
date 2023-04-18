local icons = require("config.icons")
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
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
  },
}
