local M = {}
M.default_opt = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

M.default_no_opt = { noremap = true, silent = true }

M.root_patterns = { ".git", "lua" }

M.on_attach = function (on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client,buffer)
    end
  })
end

M.get_root = function ()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.loop.fs_realpath(path) or nil
  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if r ~= nil and path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  ---@cast root string
  return root
end

M.telescope = function (builtin, opts)
  local params = { builtin = builtin, opts = opts }
  return function()
    builtin = params.builtin
    opts = params.opts
    opts = vim.tbl_deep_extend("force", { cwd = M.get_root() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
    require("telescope.builtin")[builtin](opts)
  end
end

M.setwhichkey = function (map,opt)
  local wk = require("which-key")
  local option = vim.tbl_extend("force", M.default_opt, opt or {})
  wk.register(map, option)
end

M.setkeymap = function (map)
  local option = vim.tbl_extend("force", M.default_no_opt, map[4] or {})
  vim.keymap.set(map[1], map[2], map[3], option)
end

M.setkeydynamic = function (opts)
  local status = pcall(require, "which-key")
  if status == false then
    M.setkeymap({ opts[1], opts[2], opts[3], vim.tbl_extend("force", opts[4], { desc = opts[5] }) })
  else
    M.setwhichkey({
      [opts[2]] = { opts[3], opts[5] }
    }, {
      mode = opts[1]
    })
  end
end

return M
