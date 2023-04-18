return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(
        "package.json",
        "vue.config.js",
        ".null-ls-root",
        ".neoconf.json",
        "Makefile",
        ".git"
      ),
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        require("typescript.extensions.null-ls.code-actions"),
        nls.builtins.formatting.eslint_d,
        nls.builtins.diagnostics.eslint_d,
      },
    }
  end,
}
