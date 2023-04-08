local M = {}

M.on_attach = function(_, buf)
  local tools = require("tools.tool")
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = buf }
  local keymaps = {
    { "n", "gd", vim.lsp.buf.definition, opts, "Goto definition" },
    { "n", "gD", vim.lsp.buf.declaration, opts, "Goto declaration" },
    { "n", "gi", vim.lsp.buf.implementation, opts, "Goto implementation" },
    { "n", "gr", vim.lsp.buf.references, opts, "Gogo references" },
    { "n", "gt", vim.lsp.buf.type_definition, opts, "Goto definition" },
    { "n", "K", vim.lsp.buf.hover, opts, "Show LSP info" },
    { "n", "<A-k>", vim.lsp.buf.signature_help, opts, "Show signature_help" },
    { "n", "<leader>rn", vim.lsp.buf.rename, opts, "CodeAction-rename" },
    { "n", "<leader>ca", vim.lsp.buf.code_action, opts, "CodeAction" },
    { "n", "<leader>\\", function ()
      vim.lsp.buf.format({ async = true })
    end , opts, "Format" },
    { "n", "<leader>[", vim.diagnostic.goto_prev, opts, "Prev diagnostic" },
    { "n", "<leader>]", vim.diagnostic.goto_next, opts, "Next diagnostic" },
    { "n", "<leader>q", vim.diagnostic.setloclist, opts, "Show diagnostic list" },
  }
  for _, value in pairs(keymaps) do
    tools.setkeydynamic(value)
  end
end

M.diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
