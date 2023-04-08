local M = {
  registry = {
    { "n", "<leader>ee", "<cmd>Neotree toggle<cr>", {}, "Neotree toggle" },
    { "n", "<leader>ef", "<cmd>Neotree focus<cr>",  {}, "Neotree focus" },
  },
  noRegistry = {
    -- insert
    { "i", "jk",    "<Esc>",   {}, "Exist insert mode" },
    { "i", "<A-h>", "<Left>",  {}, "Left in insert mode" },
    { "i", "<A-l>", "<Right>", {}, "Right in insert mode" },
    { "i", "<A-k>", "<Up>",    {}, "Up in insert mode" },
    { "i", "<A-j>", "<Down>",  {}, "Down in insert mode" },

    -- normal
    { "n", "H",     "^",       {}, "Go the head in normal mode" },
    { "n", "L",     "$",       {}, "Go the end in normal mode " },
    { "n", "<A-v>", "<C-v>",   {}, "Enter column visual mode" },
    { "n", "gb",    "<C-o>",   {}, "Back forward" },

    -- visual
    { "v", "H",     "^",       {}, "Go the head in visual mode" },
    { "v", "L",     "$",       {}, "Go the end in visual mode" },
  },
}

local tools = require("tools.tool")

for _, v in pairs(M.registry) do
  tools.setkeydynamic(v)
end

for _, v in pairs(M.noRegistry) do
  tools.setkeydynamic(v)
end
