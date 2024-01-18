return {
  "mawkler/modicator.nvim",
  -- dependencies = "folke/tokyonight.nvim", -- Add your colorscheme plugin here
  event = "BufRead",
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  config = function(_, opts)
    require("modicator").setup(opts)
  end,
  opts = {
    -- Show warning if any required option is missing
    show_warnings = true,
    highlights = {
      -- Default options for bold/italic
      defaults = {
        bold = true,
        italic = false,
      },
    },
  },
}
