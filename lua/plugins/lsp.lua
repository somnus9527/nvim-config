return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- add a keymap
    keys[#keys + 1] = {
      "<leader>\\",
      function()
        vim.lsp.buf.format({ async = true })
      end,
    }
  end,
  opts = {
    autoformat = false,
    -- make sure mason installs the server
    servers = {
      ---@type lspconfig.options.tsserver
      tsserver = {
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
      jsonls = {
        -- lazy-load schemastore when needed
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = { enable = true },
          },
        },
      },
      vuels = {},
      cssls = {},
      html = {},
    },
    setup = {
      tsserver = function(_, opts)
        require("lazyvim.util").on_attach(function(client, buffer)
          if client.name == "tsserver" then
            -- stylua: ignore
            vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>",
              { buffer = buffer, desc = "Organize Imports" })
            -- stylua: ignore
            vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
          end
        end)
        require("typescript").setup({ server = opts })
        return true
      end,
    },
  },
  ---@param opts PluginLspOpts
  config = function(_, opts)
    -- 使用null-ls进行格式化
    -- setup autoformat
    require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
    -- setup formatting and keymaps
    require("lazyvim.util").on_attach(function(client, buffer)
      -- require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormat." .. buffer, {}),
          buffer = buffer,
          callback = function()
            if opts.autoformat then
              local buf = vim.api.nvim_get_current_buf()
              local ft = vim.bo[buf].filetype
              local has_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

              vim.lsp.buf.format({
                bufnr = buf,
                filter = function(iclient)
                  if has_nls then
                    return iclient.name == "null-ls"
                  end
                  return iclient.name ~= "null-ls"
                end,
              })
            end
          end,
        })
      end
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    end)

    -- diagnostics
    for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
    vim.diagnostic.config(opts.diagnostics)

    local servers = opts.servers
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    -- get all the servers that are available thourgh mason-lspconfig
    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local all_mslp_servers = {}
    if have_mason then
      all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    if have_mason then
      mlsp.setup({ ensure_installed = ensure_installed })
      mlsp.setup_handlers({ setup })
    end
  end,
}
