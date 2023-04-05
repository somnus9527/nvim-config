local M = {}

M.g = {
  mapleader = " "
}

M.opt = {
  number = true,
  relativenumber = true
}


for k,v in pairs(M) do
  for ik,iv in pairs(v) do
    vim[k][ik] = iv
  end
end
