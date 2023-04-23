local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    local dropdown = require('telescope.themes').get_dropdown({ layout_config = { width = 0.8 }, winblend = 10 })
    return {
      {
        "<leader>,",
        function()
          require("telescope.builtin").buffers(dropdown)
        end,
        desc = "Switch Buffer",
      },
      { "<leader>/",       Util.telescope("live_grep", dropdown), desc = "Find in Files (Grep)" },
      { "<leader>:",       "<cmd>Telescope command_history<cr>",   desc = "Command History" },
      { "<leader><space>", Util.telescope("files", dropdown),     desc = "Find Files (root dir)" },
      {
        "<leader>.",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(dropdown)
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
          ["<c-n>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<c-m>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
          ["<a-n>"] = function (...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<a-m>"] = function (...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["<cr>"] = function (...)
            return require("telescope.actions").select_default(...)
          end
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
          ["<cr>"] = function (...)
            return require("telescope.actions").select_default(...)
          end
        },
      },
    },
  },
}
