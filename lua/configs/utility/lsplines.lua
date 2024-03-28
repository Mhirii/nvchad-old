return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  keys = {
    {
      "<leader>Ti",
      function()
        require("lsp_lines").toggle()
      end,
      desc = "LspLines - Toggle",
      mode = { "n" },
    },
  },
  config = function()
    require("lsp_lines").setup()
  end,
}
