local M = {}

M.lang = { -- TODO: add Go, cpp and Zig
  typescript = true,
  rust = true,
  go = true,
  cpp = true,
  zig = true,
}

M.ui = {
  tree = "nvimtree", --TODO: add neotree and oil.nvim
  code_actions = true,
  context = true,
}

M.ai = { -- TODO: add Tabnine
  codeium = true,
}

M.motions = {
  harpoon = true,
  bookmarks = true,
  hop = true,
}

M.multiplexer = "wezterm" -- wezterm | tmux.

M.formatter = "none-ls"   -- none-ls | conform. TODO: Configure conform and lint

return M
