local settings = require "settings"
return {
  "smjonas/inc-rename.nvim",
  event = "VeryLazy",
  config = function()
    if settings.ui.noice then
      require("inc_rename").setup()
    else
      require("inc_rename").setup {
        input_buffer_type = "dressing",
      }
    end
    vim.keymap.del("n", "<leader>cr")
    vim.keymap.set("n", "<leader>cr", ":IncRename ", { desc = "IncRename" })
  end,
}
