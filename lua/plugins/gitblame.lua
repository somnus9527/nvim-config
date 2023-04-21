return {
  "f-person/git-blame.nvim",
  command = "GitBlameToggle",
  keys = {
    {
      "<leader>gb",
      "<cmd>GitBlameToggle<cr>",
      desc = "Git Glame Toggle"
    }
  },
  config = function ()
    vim.g.gitblame_message_template = '<committer> • <committer-date> • <summary>'
    vim.g.gitblame_date_format = '%c'
  end
}
