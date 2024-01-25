local M = {}

M.lang = { -- TODO: add cpp
  typescript = true,
  rust = true,
  go = true,
  cpp = true,

  hyprland = true,
}

M.ui = {
  tree = "nvimtree",
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
  fidget = false,
  noice = true,
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
  cheat = false,
}

M.lspzero = false

M.multiplexer = "wezterm" -- wezterm | tmux -- edit: the plugin works well with both

M.formatter = "none-ls"   -- none-ls | conform. TODO: Configure conform and lint

M.refactoring = true

M.extras = {
  persist = true,
  git = true,
  projects = false,
  terms = true,
  recorder = true,
  neorg = true,
}

return M
