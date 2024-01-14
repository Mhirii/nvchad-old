local M = {}

local wk = require "which-key"

M.prefixes = function()
  -- TODO: Rewise this frequently
  -- WhichKey prefixes:
  wk.register {
    ["<leader>"] = {
      -- stylua: ignore start
      [" "] = { name = " Quick" },
      b     = { name = "󱂬 Buffer" },
      c     = { name = "󱃖 Code" },
      cm    = { name = " Markdown" },
      cp    = { name = " Cpp" }, --   󰙲
      cx    = { name = "󱣘 Cargo.toml" },
      cz    = { name = " Snippet" },
      f     = { name = " Find" },
      g     = { name = " Git" },
      h     = { name = "󱕘 Harpoon" },
      j     = { name = " Join" },
      l     = { name = "󱃕 Lists" },
      lt    = { name = " TODO" },
      m     = { name = " Modes" },
      ml    = { name = "󰉦 Lush" },
      nt    = { name = "󱘎 TreeSitter" },
      o     = { name = " Open" },
      p     = { name = " Profile" }, -- 
      q     = { name = "󰗼 Quit" },
      s     = { name = " LSP" },
      -- t     = { name = "󰙨 Test"              },
      -- u     = { name = "󰚰 Update"            },
      w     = { name = " Workspace" },
      z     = { name = "+ Extras" },
      -- stylua: ignore end
    },
  }
end

M.opts = {
  icons = {
    group = "", -- disable + to make Nerf fonts usable
  },
}

return M
