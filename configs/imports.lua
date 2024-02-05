local icons = require "custom.icons"
return {
  "piersolenski/telescope-import.nvim",
  ft = { "typescript", "javascript", "lua", "cpp" },
  dependencies = "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup {
      extensions = {
        import = {
          -- Add imports to the top of the file keeping the cursor in place
          insert_at_top = true,
          -- Support additional languages
          custom_languages = {
            {
              -- The regex pattern for the import statement
              regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
              -- The Vim filetypes
              filetypes = { "typescript", "typescriptreact", "javascript", "react", "lua", "cpp" },
              -- The filetypes that ripgrep supports (find these via `rg --type-list`)
              extensions = { "js", "ts", "lua", "cpp" },
            },
          },
        },
      },
    }
  end,
  keys = {
    { mode = "n", "<leader>ci", "<cmd>Telescope import<cr>", desc = icons.ui.Package .. " Telescope Imports" },
  },
}
