return function(_, opts)
  require("lsp_signature").setup(opts)
  return {
    keys = {
      {
        "<leader>us",
        mode = "n",
        desc = "Lsp Signature Mode",
      },
    },
  }
end
