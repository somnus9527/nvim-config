local tools = require("tools.tool")

return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    "folke/which-key.nvim",
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<A-n>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<A-m>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
    -- TODO: FIX: 不知道为啥设置成下拉的样式不生效，有机会再处理吧
    pickers = {
      find_files = {
        theme = "dropdown",
      },
    },
  },
  config = function()
    local keymaps = {
      { "n", "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", {}, "Switch buffers" },
      { "n", "<leader>/", tools.telescope("live_grep"), {}, "Find in Files (Grep)" },
      { "n", "<leader>:", "<cmd>Telescope command_history<cr>", {}, "Command history" },
      -- 太常用了 从<space>ff -> <space><space>
      { "n", "<leader><space>", tools.telescope("files"), {}, "Find files (root dir)" },
      { "n", "<leader>fb", "<cmd>Telescope buffers<cr>", {}, "Find buffers" },
      { "n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {}, "Recent files" },
      {
        "n",
        "<leader>fs",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        {},
        "Find char in current buffer",
      },
      -- 后续添加git相关插件，不需要
      -- { "n", "<leader>gc", "<cmd>Telescope git_commits<CR>", {}, "Show git commits" },
      -- { "n", "<leader>gs", "<cmd>Telescope git_status<CR>", {}, "Show git status" },
      { "n", "<leader>sc", "<cmd>Telescope commands<cr>", {}, "Show All Commands" },
      -- { "n", "<leader>sk", "<cmd>Telescope keymaps<cr>", {}, "Show All keymaps" },
      { "n", "<leader>sC", tools.telescope("colorscheme", { enable_preview = true }), {}, "Colorscheme with preview" },
      {
        "n",
        "<leader>ss",
        tools.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        {},
        "Goto Symbol",
      },
    }
    for _, value in pairs(keymaps) do
      tools.setkeydynamic(value)
    end
  end,
}
