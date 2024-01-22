return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require("windows").setup()
  end,
  keys = {
    {
      "<leader>tw",
      function()
        require("windows").setup()
      end,
      desc = "Toggle window autosize",
    },
  },
}
