return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  { "olimorris/onedarkpro.nvim" },

  { 'Mofiqul/dracula.nvim' },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
