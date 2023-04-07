local plugins = require("tools.lazy-plugins")

local spec = {}
vim.list_extend(spec,{ { import = "plugins" }, plugins })

return {
  defaults = {
    lazy = true
  },
  spec = spec,
  git = {
    log = { "--since=3 days ago" },
    timeout = 3000,
    filter = true
  },
  install = {
    missing = true
  }
}
