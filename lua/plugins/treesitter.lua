return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "typescript",
        "tsx",
        "json",
        "json5",
        "jsonc",
        "css",
        "scss",
        "vue",
        "yaml",
        "html",
        "rust",
        "toml",
      })
    end
    opts.autotag = {
      enable = true,
      filetype = { "html", "xml", "vue" },
    }
  end,
  config = function(_, opts)
    -- 尝试修复成功，windows powershell 环境下需要下载LLVM： https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.0，安装完成之后，1. TSUpdate 2. TSInstall parser【确实的parser，我这边是html】，完成之后，退出，refreshenv，重进，成功打开html，这边再次放开
    -- 这边有bug，treesitter打开html文件在windows powershell环境下会报错，issue地址：https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting，暂时注释html相关
    local ost = vim.fn.has('macunix')
    if ost == 0 then
      print("windows system")
      require("nvim-treesitter.install").compilers = { "clang" }
    end
    require("nvim-treesitter.configs").setup(opts)
  end,
}
