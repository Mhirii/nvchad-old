local M = {}

M.keys = {
  {
    "<leader>fi",
    "<cmd>Cheatsheet<cr>",
    mode = "n",
    desc = "Find Cheat",
  },
}

M.dependencies = {
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
}

return M
