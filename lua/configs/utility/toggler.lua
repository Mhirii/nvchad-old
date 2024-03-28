return {
  "nguyenvukhang/nvim-toggler",
  config = function()
    require("nvim-toggler").setup {
      inverses = {
        ["disable"] = "enable",
      },
    }
  end,
  keys = {
    {
      "<leader>i",
      mode = { "n", "v" },
      function()
        require("nvim-toggler").toggle()
      end,
      desc = "Toggler",
    },
  },
}
