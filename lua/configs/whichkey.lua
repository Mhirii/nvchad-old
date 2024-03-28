local wk = require "which-key"

return {
  "folke/which-key.nvim",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)

    wk.register {
      ["<leader>"] = {
        -- stylua: ignore start
        -- [" "] = { name = " Quick" },
        b     = { name = "󰈔 Buffer" },
        c     = { name = "󰘦 Code" },
        co    = { name = " Copilot" },
        g     = { name = "󰊤 Git" },
        h     = { name = "󰛢 Harpoon/Hop" },
        l     = { name = "󱃕 Lists" },
        n     = { name = "󰐕 new" },
        o     = { name = "󰘖 Open" },
        p     = { name = " Preview" },
        q     = { name = "󰁯 Session" },
        r     = { name = " Refactor" },
        s     = { name = "󱦞 Search" },
        t     = { name = "󰙨 Test" },
        T     = { name = " Toggle" },
        Tn    = { name = " Line number" },
        w     = { name = "󰉋 Workspace" },
        z     = { name = "󰍻 Extras" },
      },
    }
  end,
  opts = {
    icons = {
      group = "", -- disable + to make Nerf fonts usable
    },
  },
}
