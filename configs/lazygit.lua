return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  keys = {
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
