return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>df",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "Show current file history & diff",
    },
    {
      "<leader>do",
      "<cmd>DiffviewOpen<cr>",
      desc = "Diffview open",
    },
    {
      "<leader>dc",
      "<cmd>DiffviewClose<cr>",
      desc = "Diffview close"
    }
  }
}
