return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>vf",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "Show current file history & diff",
    },
    {
      "<leader>vo",
      "<cmd>DiffviewOpen<cr>",
      desc = "Diffview open",
    },
    {
      "<leader>vc",
      "<cmd>DiffviewClose<cr>",
      desc = "Diffview close"
    }
  }
}
