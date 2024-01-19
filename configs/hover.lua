return {
  "lewis6991/hover.nvim",
  event = "VeryLazy",
  config = function()
    require("hover").setup {
      init = function()
        -- Require providers
        require "hover.providers.lsp"
        -- require('hover.providers.gh')
        -- require('hover.providers.gh_user')
        -- require('hover.providers.jira')
        require "hover.providers.man"
        require "hover.providers.dictionary"
      end,
      preview_opts = {
        border = "single",
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
      mouse_providers = {
        "LSP",
      },
      mouse_delay = 1000,
    }

    -- Setup keymaps
    -- require("hover").hover
    -- require("hover").hover_select" })
    -- require("hover").hover_switch "previous"
    -- require("hover").hover_switch "next"
    -- Mouse support
    -- vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
    -- vim.o.mousemoveevent = true
  end,
}
