-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local dopt = {
  silent = true,
}

local keymap = {
  { "i",          "jk",    "<Esc>",              dopt },
  { "i",          "<A-h>", "<Left>",             dopt },
  { "i",          "<A-j>", "<Down>",             dopt },
  { "i",          "<A-k>", "<Up>",               dopt },
  { "i",          "<A-l>", "<Right>",            dopt },
  { "i",          "<A-w>", "<Esc>ea",            dopt },
  { "i",          "<A-b>", "<Esc>bi",            dopt },
  { { "v", "o" }, "H",     "^",                  dopt },
  { { "v", "o" }, "L",     "$",                  dopt },
  { { "v", "o" }, "'",     "i'",                 dopt },
  { { "v", "o" }, '"',     'i"',                 dopt },
  { { "v", "o" }, "(",     "i)",                 dopt },
  { { "v", "o" }, ")",     "a)",                 dopt },
  { { "v", "o" }, "{",     "i}",                 dopt },
  { { "v", "o" }, "}",     "a}",                 dopt },
  { { "v", "o" }, "[",     "i]",                 dopt },
  { { "v", "o" }, "]",     "a]",                 dopt },
  { { "v", "o" }, "<",     "i>",                 dopt },
  { { "v", "o" }, ">",     "a>",                 dopt },
  { "n",          "<A-j>", "20j",                dopt },
  { "n",          "<A-k>", "20k",                dopt },
  { "n",          "H",     "^",                  dopt },
  { "n",          "L",     "$",                  dopt },
  { "n",          "<A-v>", "<C-v>",              dopt },
  { "n",          "gb",    "<C-o>",              dopt },
  { "n",          "|",     "<cmd>vsplit<cr>",    dopt },
  { "n",          "\\",    "<cmd>split<cr>",     dopt },
  { "n",          "<A-h>", "<cmd>bprevious<cr>", dopt },
  { "n",          "<A-l>", "<cmd>bnext<cr>",     dopt },
}

for _, value in pairs(keymap) do
  map(value[1], value[2], value[3], value[4])
end
