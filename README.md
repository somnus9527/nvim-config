### 基础配置从 💤 LazyVim fork而来

#### 问题记录

- treesitter报错
  - 报错原因&现象
    > treesitter打开html文件在windows powershell环境下会报错，issue地址：https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting
  - 处理办法
    > windows powershell 环境下需要下载LLVM： https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.0，安装完成之后，1. TSUpdate 2. TSInstall parser【确实的parser，我这边是html】，完成之后，退出，refreshenv，重进

- treesitter fold 功能异常缺失
  - 现象
    > 从neotree打开文件，treesitter fold功能正常，但是从telescope打开文件，fold会报错：No fold tag
  - issue 地址
    > [地址](https://github.com/nvim-telescope/telescope.nvim/issues/699)
  - 解决办法
    > 目前issue并没有解决，只能通过盘外招，方式如下：
    > 1. autocmd中添加自动命令，在buf打开时自动执行zR命令
    > 2. 这边自动执行zR命令发现会造成切换到neotree时会关闭所有节点，问题原因时neotree中的z指令冲突了，所以禁用了neotree的z相关指令
