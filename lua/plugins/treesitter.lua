return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- PERF: no need to load the plugin, if we only need its queries for mini.ai
          local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
          local opts = require("lazy.core.plugin").values(plugin, "opts", false)
          local enabled = false

          if opts.textobjects then
            for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
              if opts.textobjects[mod] and opts.textobjects[mod].enable then
                enabled = true
                break
              end
            end
          end
          -- 暂时还没用到，自定义snippet
          if not enabled then
            require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          end
        end,
      },
    },
    keys = {
      -- 后续会增加类expend-region插件，这个不好用，注释掉
      -- { "<A-n>", desc = "Increment selection" },
      -- { "<A-m>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "c",
        "cpp",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "css",
        "vue",
      },
      -- 同keys的注释
      -- incremental_selection = {
      -- enable = true,
      -- keymaps = {
      --  init_selection = "<A-n>",
      --  node_incremental = "<A-n>",
      --  scope_incremental = "<nop>",
      --  node_decremental = "<A-m>",
      -- },
      --},
    },
    config = function(_, opts)
      -- 尝试修复成功，windows powershell 环境下需要下载LLVM： https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.0，安装完成之后，1. TSUpdate 2. TSInstall parser【确实的parser，我这边是html】，完成之后，退出，refreshenv，重进，成功打开html，这边再次放开
      -- 这边有bug，treesitter打开html文件在windows powershell环境下会报错，issue地址：https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting，暂时注释html相关
      require("nvim-treesitter.install").compilers = { "clang" }
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
