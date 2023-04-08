local default_opt = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local default_no_opt = { noremap = true, silent = true }

local M = {
  registry = {
    {
      opt = {
        prefix = "<leader>",
      },
      map = {
        e = {
          name = "NeoTree",
          e = {
            "<cmd>Neotree toggle<cr>",
            "Toggle Explorer",
          },
          f = {
            "<cmd>Neotree focus<cr>",
            "Focus Expolrer",
          },
        },
      },
    },
  },
  noRegistry = {
    -- insert
    { "i", "jk", "<Esc>" },
    { "i", "<A-h>", "<Left>" },
    { "i", "<A-l>", "<Right>" },
    { "i", "<A-k>", "<Up>" },
    { "i", "<A-j>", "<Down>" },

    -- normal
    { "n", "H", "^" },
    { "n", "L", "$" },
    { "n", "<A-v>", "<C-v>" },
    { "n", "gb", "<C-o>" },

    -- visual
    { "v", "H", "^" },
    { "v", "L", "$" },
  },
}

local wk = require("which-key")

for _, v in pairs(M.registry) do
  local opt = vim.tbl_extend("force", default_opt, v.opt or {})
  wk.register(v.map, opt)
end

for _, v in pairs(M.noRegistry) do
  local opt = vim.tbl_extend("force", default_no_opt, v[4] or {})
  vim.keymap.set(v[1], v[2], v[3], opt)
end
