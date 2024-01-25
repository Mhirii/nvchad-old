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
  oil = true,
  trouble = true,
  code_actions = true,
  scroll = true,
  context = true,
  lens = true,
  split_animation = true,
  mode_indicator = "modicator", -- modicator or reactive
  hover = true,
  glance = true,
  notify = true,
}

M.ai = { -- TODO: add Tabnine
  codeium = true,
}

M.motions = {
  harpoon = true,
  bookmarks = true,
  hop = true,
}

M.utilities = {
  aerial = true,
  lsplines = true,
  rest = true,
}

M.lspzero = false

M.multiplexer = "wezterm" -- wezterm | tmux.

M.formatter = "none-ls"   -- none-ls | conform. TODO: Configure conform and lint

M.neorg = true

M.dotfiles = {
  hyprland = true,
}

return M
