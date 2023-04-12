return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit",
  config = function ()
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_use_plenary = 1
  end
}
