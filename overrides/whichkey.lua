local wk = require "which-key"
local icons = require "custom.icons"

return {
  "folke/which-key.nvim",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)

    wk.register {
      ["<leader>"] = {
        -- stylua: ignore start
        [" "] = { name = " Quick" },
        b     = { name = icons.ui.File .. " Buffer" },
        c     = { name = icons.ui.Code .. " Code" },
        f     = { name = icons.ui.Telescope .. " Find" },
        g     = { name = icons.git.Branch .. " Git" },
        h     = { name = "󱕘 Hop" },
        l     = { name = "󱃕 Lists" },
        m     = { name = icons.ui.BookMark .. " Marks" },
        o     = { name = icons.ui.EmptyFolderOpen .. " Open" },
        p     = { name = icons.ui.OpenPreview .. " Preview" },
        q     = { name = icons.ui.History .. " Session" },
        r     = { name = icons.ui.Refresh .. " Refactor" },
        s     = { name = icons.ui.Telescope .. " Search" },
        t     = { name = icons.kind.Boolean .. " Toggle" },
        tn    = { name = " Line number" },
        u     = { name = icons.ui.Download .. " Update" },
        w     = { name = icons.ui.FolderOpen .. " Workspace" },
        z     = { name = icons.ui.Ellipsis .. " Extras" },
      },
    }
  end,
  opts = {
    icons = {
      group = "", -- disable + to make Nerf fonts usable
    },
  },
}
