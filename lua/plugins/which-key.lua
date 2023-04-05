return {
  "folke/which-key.nvim",
  lazy = false,
  config = function() 
    vim.o.timeout = true
    vim.o.timeoutlen = 2000
    require("which-key").setup {}

    require("tools.key-registry")
  end
}
