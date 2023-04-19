-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local o = vim.o

opt.backup = false
opt.swapfile = false
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termguicolors = true

o.guifont = "SpaceMono NF:h13"
o.timeout = true
o.timeoutlen = 500
