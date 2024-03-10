return {
  "VidocqH/lsp-lens.nvim",
  config = function()
    local SymbolKind = vim.lsp.protocol.SymbolKind

    require("lsp-lens").setup {
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = {                 -- Enable / Disable specific request, formatter example looks 'Format Requests'
        definition = true,
        references = true,
        implements = true,
        git_authors = false,
      },
      ignore_filetype = {
        "prisma",
      },
      -- Target Symbol Kinds to show lens information
      target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
      -- Symbol Kinds that may have target symbol kinds as children
      wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
    }
  end,
  keys = {
    { "<leader>tl", "<CMD>LspLensToggle<CR>", desc = " Toggle Lsp Lens" },
  },
}
