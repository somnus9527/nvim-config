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
      file_ignore_patterns = {
        "node_modules",
        ".git",
        "dist",
        "build",
        ".vscode",
      },
      preview = {
        treesitter = false,
      },
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<C-n>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-p>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
          ["<Esc>"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
  config = function(_, opts)
    local keymaps = {
      {
        "n",
        "<leader>,",
        "<cmd>Telescope buffers show_all_buffers=true theme=dropdown<cr>",
        {},
        "Switch buffers",
      },
      {
        "n",
        "<leader>/",
        tools.telescope("live_grep"),
        {},
        "Find in Files (Grep)",
      },
      -- { "n", "<leader>:", "<cmd>Telescope command_history<cr>", {}, "Command history" },
      -- 太常用了 从<space>ff -> <space><space>
      {
        "n",
        "<leader><space>",
        tools.telescope("files"),
        {},
        "Find files (root dir)",
      },
      -- { "n", "<leader>fb", "<cmd>Telescope buffers<cr>", {}, "Find buffers" },
      -- { "n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {}, "Recent files" },
      {
        "n",
        "<leader>.",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        {},
        "Find char in current buffer",
      },
      -- 后续添加git相关插件，不需要
      -- { "n", "<leader>gc", "<cmd>Telescope git_commits<CR>", {}, "Show git commits" },
      -- { "n", "<leader>gs", "<cmd>Telescope git_status<CR>", {}, "Show git status" },
      -- { "n", "<leader>sc", "<cmd>Telescope commands<cr>", {}, "Show All Commands" },
      -- { "n", "<leader>sk", "<cmd>Telescope keymaps<cr>", {}, "Show All keymaps" },
      {
        "n",
        "<leader>`",
        tools.telescope("colorscheme", { enable_preview = true }),
        {},
        "Colorscheme with preview",
      },
      {
        "n",
        "<leader>'",
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
    require("telescope").setup(opts)
  end,
}
