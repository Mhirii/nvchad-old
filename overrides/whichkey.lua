local wk = require "which-key"

return {
  "folke/which-key.nvim",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)

    wk.register {
      ["<leader>"] = {
        -- stylua: ignore start
        [" "] = { name = " Quick" },
        b     = { name = "󱂬 Buffer" },
        c     = { name = "󱃖 Code" },
        cx    = { name = "󱣘 Cargo.toml" },
        cz    = { name = " Snippet" },
        f     = { name = " Find" },
        g     = { name = " Git" },
        h     = { name = "󱕘 Hop" },
        l     = { name = "󱃕 Lists" },
        lt    = { name = " TODO" },
        m     = { name = "󰍎 Marks" },
        nt    = { name = "󱘎 TreeSitter" },
        o     = { name = " Open" },
        p     = { name = " Preview" },
        q     = { name = "󰗼 Quit" },
        r     = { name = " Refactor" },
        s     = { name = " LSP" }, -- TODO: this should be Search
        t     = { name = " Toggle" },
        tn    = { name = " Line number" },
        u     = { name = "󰚰 Update" },
        w     = { name = " Workspace" },
        z     = { name = "󰇘 Extras" },
      },
    }
  end,
  opts = {
    icons = {
      group = "", -- disable + to make Nerf fonts usable
    },
  },
}
