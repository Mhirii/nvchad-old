local settings = require "custom.settings"
local formatter = settings.formatter

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        opts = function()
          return require "custom.configs.null-ls"
        end,
        enabled = formatter == "none-ls",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      -- require "custom.configs.lspconfig"
    end,
  },
}
