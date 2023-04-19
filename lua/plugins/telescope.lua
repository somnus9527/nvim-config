local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    local layoutopt = {
      layout_conifg = {
        width = 0.8,
      },
    }
    return {
      {
        "<leader>,",
        function()
          require("telescope.builtin").buffers(layoutopt)
        end,
        desc = "Switch Buffer",
      },
      { "<leader>/",       Util.telescope("live_grep", layoutopt), desc = "Find in Files (Grep)" },
      { "<leader>:",       "<cmd>Telescope command_history<cr>",   desc = "Command History" },
      { "<leader><space>", Util.telescope("files", layoutopt),     desc = "Find Files (root dir)" },
      {
        "<leader>.",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(layoutopt)
        end,
        desc = "Find in current buffer",
      },
      {
        "<leader>`",
        Util.telescope("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with preview",
      },
      {
        "<leader>'",
        Util.telescope("lsp_document_symbols", {
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
        desc = "Goto Symbol",
      },
    }
  end,
  opts = {
    defaults = {
      preview = {
        treesitter = false,
      },
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            Util.telescope("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            Util.telescope("find_files", { hidden = true })()
          end,
          ["<a-n>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<a-m>"] = function(...)
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
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    }
  },
}
