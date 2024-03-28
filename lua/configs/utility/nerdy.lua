return {
  "2kabhishek/nerdy.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Nerdy",

  keys = {
    { mode = { "n" }, "<leader>sn", "<cmd>Nerdy<CR>", desc = "Nerdy - Search Nerd Icons" },
  },
}
