return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  keys = {
    {
      "<leader>lg",
      "<cmd> LazyGit<CR>",
      mode = "n",
      desc = "LazyGit",
    },
    {
      "<leader>gg",
      "<cmd> LazyGit<CR>",
      mode = "n",
      desc = "LazyGit",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
