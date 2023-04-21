return {
  "rcarriga/nvim-dap-ui",
  keys = {
    {
      "<leader>mu",
      function()
        require("dapui").toggle({})
      end,
      desc = "Dap UI",
    },
    {
      "<leader>me",
      function()
        require("dapui").eval()
      end,
      desc = "Eval",
      mode = { "n", "v" },
    },
  },
}
