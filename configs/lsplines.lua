return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
  -- NOTE: Not using this because it's annoying
  -- keys = {
  --   "<Leader>ti",
  --   ":lua require('lsp_lines').toggle() <CR>",
  --   desc = "∥ Toggle lsp_lines",
  -- },
}
