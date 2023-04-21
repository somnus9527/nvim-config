return {
  "mfussenegger/nvim-dap",
  keys = {
    {
      "<leader>mb",
      function ()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>mc",
      function ()
        require("dap").continue()
      end,
      desc = "Continue"
    },
    {
      "<leader>mC",
      function ()
        require("dap").run_to_cursor()
      end,
      desc = "Run to Cursor"
    },
    {
      "<leader>mg",
      function ()
        require("dap").goto_line()
      end,
      desc = "Go to line"
    },
    {
      "<leader>mi",
      function ()
        require("dap").step_into()
      end,
      desc = "Step Into"
    },
    {
      "<leader>mj",
      function ()
        require("dap").down()
      end,
      desc = "Down"
    },
    {
      "<leader>mk",
      function ()
        require("dap").up()
      end,
      desc = "Up"
    },
    {
      "<leader>ml",
      function ()
        require("dap").run_last()
      end,
      desc = "Run Last"
    },
    {
      "<leader>mo",
      function ()
        require("dap").step_out()
      end,
      desc = "Step Out"
    },
    {
      "<leader>mO",
      function ()
        require("dap").step_over()
      end,
      desc = "Step Over"
    },
    {
      "<leader>mp",
      function ()
        require("dap").pause()
      end,
      desc = "Pause"
    },
    {
      "<leader>mr",
      function ()
        require("dap").restart()
      end,
      desc = "Restart"
    },
    {
      "<leader>ms",
      function ()
        require("dap").session()
      end,
      desc = "Session"
    },
    {
      "<leader>mt",
      function ()
        require("dap").terminate()
      end,
      desc = "Terminate"
    },
    {
      "<leader>mw",
      function ()
        require("dap.ui.widgets").hover()
      end,
      desc = "Widgets"
    }
  },
  config = function ()
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
    local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/")
    local dap = require("dap")

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = mason_path .. "codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
        detached = false,
      }
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function ()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      }
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.codelldb
  end
}
