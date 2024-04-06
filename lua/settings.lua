local M = {}

M.lang = {
  typescript = true,
  javascript = true,
  rust = true,
  go = true,
  lua = true,
  json = true,
  yaml = true,
  markdown = true,
  sh = true,
  bash = true,
  fish = true,
  cpp = true,
  c = true,
  norg = true,
  hyprland = true,
  html = true,
  css = true,
  vue = true,
}

M.editor = {
  formatter = "confrom", -- "null-ls" or "confrom"
  linter = true,
  copilot = true,
  copilot_chat = true,
  dap = true,
  compiler = true,
  aerial = true,
  inc_rename = true,
  hover = false,
  lsp_preview = true,
  oil = true,
  sessions = true,
}

M.ui = {
  trouble = true,
  code_actions = true,
  smooth_scroll = true,
  lens = true,
  mode_indicator = true,
  notify = true,
  noice = true,
  split_animation = true,
  illuminate = true,
  ufo = true,
  hlslens = true,
}

M.motions = {
  harpoon = true,
  hop = true,
}

M.multiplexer = true

M.utility = {
  lsplines = true,
  nerdy = true,
  persist = true,
  git = true,
  obsidian = false,
  todo_comments = true,
  comment_box = true,
  pomodoro = true,
  notes = true,
  undotree = true,
}

return M
