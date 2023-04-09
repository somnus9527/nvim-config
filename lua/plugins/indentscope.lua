return {
  "echasnovski/mini.nvim",
  event = "InsertEnter",
  version = false,
  opts = {
    mappings = ""
  },
  config = function (...)
    require("mini.indentscope").setup(...)
  end
}
