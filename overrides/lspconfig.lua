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
      if settings.lspzero then
        local lsp_zero = require "lsp-zero"
        lsp_zero.extend_lspconfig()
      end
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
