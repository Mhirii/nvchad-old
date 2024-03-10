return {
  "stevearc/dressing.nvim",
  lazy = false,
  config = function(_, opts)
    require("dressing").setup(opts)
  end,
  opts = {
    input = {
      enabled = true,
      default_prompt = "❯ ",
      win_options = {
        winblend = 0,
      },
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },
      builtin = {
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
