return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  -- stylua: ignore
  keys = {
    { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>td", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
    { "<leader>tD", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>;", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
  },
}
