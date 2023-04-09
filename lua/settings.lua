local M = {}

M.g = {
  mapleader = " ",
}

M.opt = {
  number = true,
  relativenumber = true,
  cursorline = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  autoindent = true,
  expandtab = true,
  clipboard = "unnamedplus",
  guifont = "SpaceMono NF:h13",
  encoding = "utf-8",
  fileencoding = "utf-8",
  showmode = false,
  backup = false,
  swapfile = true,
  ignorecase = false,
  smartcase = true,
  termguicolors = true,
}

for k, v in pairs(M) do
  for ik, iv in pairs(v) do
    vim[k][ik] = iv
  end
end
