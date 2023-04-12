local M = {
  registry = {
    { "n", "<leader>ee", "<cmd>Neotree toggle<cr>", {}, "Neotree toggle" },
    { "n", "<leader>ef", "<cmd>Neotree focus<cr>", {}, "Neotree focus" },
    { "n", "<leader>1", "<cmd>BufferLineCycleNext<cr>", {}, "Buffer Next" },
    { "n", "<leader>2", "<cmd>BufferLineCyclePrev<cr>", {}, "Buffer Previous" },
    { "n", "<leader>3", "<cmd>BufferLinePick<cr>", {}, "Choose buffer" },
    { "n", "<leader>4", "<cmd>BufferLinePickClose<cr>", {}, "Choose buffer to close" },
  },
  noRegistry = {
    -- insert
    { "i", "jk", "<Esc>", {}, "Exist insert mode" },
    { "i", "<A-h>", "<Left>", {}, "Left in insert mode" },
    { "i", "<A-l>", "<Right>", {}, "Right in insert mode" },
    { "i", "<A-k>", "<Up>", {}, "Up in insert mode" },
    { "i", "<A-j>", "<Down>", {}, "Down in insert mode" },

    -- normal
    { "n", "H", "^", {}, "Go the head in normal mode" },
    { "n", "L", "$", {}, "Go the end in normal mode " },
    { "n", "<A-v>", "<C-v>", {}, "Enter column visual mode" },
    { "n", "gb", "<C-o>", {}, "Back forward" },
    { "n", "|", "<cmd>vsplit<cr>", {}, "Vertical split" },
    { "n", "\\", "<cmd>split<cr>", {}, "Horizental split", },
    { "n", "<leader>gg", "<cmd>LazyGit<cr>", {}, "Open git window" },
    -- 不好用 
    -- { "n", "<A-w>", "<cmd>ExpSel<cr>", {}, "Expand selection" },

    -- visual
    { "v", "H", "^", {}, "Go the head in visual mode" },
    { "v", "L", "$", {}, "Go the end in visual mode" },

    -- operator
    { "o", "(", "i)", {}, "Operate whole content in ()" },
    { "o", ")", "a)", {}, "Operate whole content in (), contain ()" },
    { "o", "'", "i'", {}, "Operate whole content in ''" },
    { "o", '"', 'i"', {}, 'Operate whole content in ""' },
    { "o", "[", "i]", {}, "Operate whole content in []" },
    { "o", "]", "a]", {}, "Operate whole content in [], contain []" },
    { "o", "{", "i}", {}, "Operate whole content in {}" },
    { "o", "}", "a}", {}, "Operate whole content in {}, contain {}" },
    { "o", "<", "i>", {}, "Operate whole content in <>" },
    { "o", "<", "a>", {}, "Operate whole content in <>, contain <>" },
  },
}

local tools = require("tools.tool")

for _, v in pairs(M.registry) do
  tools.setkeydynamic(v)
end

for _, v in pairs(M.noRegistry) do
  tools.setkeydynamic(v)
end
