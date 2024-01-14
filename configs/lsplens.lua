return function(opts)
  require("lsp-lens").setup(opts)
  return {

    keys = {
      {
        "<leader>mj",
        "<cmd> LspLensToggle<CR>",
        mode = "n",
        desc = "Enable Lsp Lens",
      },
    },

    opts = {
      enable = true,
      include_declaration = false, -- Reference include declaration

      sections = { -- Enable / Disable specific request
        definition = false,
        references = true,
        implements = true,
      },

      ignore_filetype = {
        "prisma",
      },
    },
  }
end
