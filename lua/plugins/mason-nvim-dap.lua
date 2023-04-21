return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = "mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    automatic_setup = true,
    handlers = {},
    ensure_installed = {
      "codelldb",
    }
  }
}
