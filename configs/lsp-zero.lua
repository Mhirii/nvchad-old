return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  event = "BufReadPre",
  dependencies = {

    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
  },
  config = function()
    local lsp_zero = require "lsp-zero"
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps { buffer = bufnr }
    end)
    require("mason").setup {}
    require("mason-lspconfig").setup {
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "cssmodules_ls",
        "dockerls",
        "gopls",
        "html",
        "biome",
        "tsserver",
        "lua_ls",
        "rust_analyzer",
        "svelte",
        "tailwindcss",
        "volar",
        "yamlls",
        "taplo",
        "jqls",
        "dotls",
      },
      handlers = {
        lsp_zero.default_setup,
        volar = function()
          require "custom.configs.lsp.volar"
        end,
      },
    }
  end,
}
