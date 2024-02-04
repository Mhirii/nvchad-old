return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  cmd = { "Cheatsheet" },
  keys = {
    {
      "<leader>sC",
      "<cmd>Cheatsheet<CR>",
      mode = { "n", "v" },
      desc = "Telescope Cheatsheet",
    },
  },
}
