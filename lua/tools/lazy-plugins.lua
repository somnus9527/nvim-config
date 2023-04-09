return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    branch = "main",
    config = function()
      require("tokyonight").setup({
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day", -- The theme is used when the background is set to light
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "windwp/nvim-ts-autotag",
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "HiPhish/nvim-ts-rainbow2",
  }
}
