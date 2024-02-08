local settings = require "custom.settings"
local typescipt = settings.lang.typescript
local rust = settings.lang.rust
local go = settings.lang.go
local hypr = settings.lang.hyprland
local motions = settings.motions
local ui = settings.ui
local formatter = settings.formatter
local mux = settings.multiplexer
local utils = settings.utilities
local x = settings.extras

---@type NvPluginSpec[]
local plugins = {

  -- ── Overrides ───────────────────────────────────────────────────{
  { import = "custom.overrides.lspconfig" },
  { import = "custom.overrides.mason" },
  { "williamboman/mason-lspconfig.nvim" },
  { import = "custom.overrides.treesitter" },
  { import = "custom.overrides.nvimtree" },
  { import = "custom.overrides.telescope" },
  { import = "custom.overrides.cmp" },
  { import = "custom.overrides.whichkey" },
  { import = "custom.overrides.nvterm" },
  { import = "custom.overrides.conform", enabled = formatter == "conform" },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
    enabled = formatter == "none-ls",
  },
  --}

  -- ── Lsp ─────────────────────────────────────────────────────────{
  { import = "custom.configs.lsp-zero", enabled = settings.lspzero },
  --" useful in nested code"
  { import = "custom.configs.context-vt", enabled = ui.context },
  -- leader c p
  { import = "custom.configs.actions-preview", enabled = ui.code_actions },
  -- Buffer Navigation
  { import = "custom.configs.aerial", enabled = utils.aerial },
  -- Refactoring
  { import = "custom.configs.refactoring", enabled = settings.refactoring },
  -- Explanation Lines below errors
  { import = "custom.configs.lsplines", enabled = utils.lsplines },
  --}

  -- ── Lang ────────────────────────────────────────────────────────{
  -- typescipt
  { import = "custom.configs.ts", enabled = typescipt },
  { import = "custom.configs.imports", enabled = typescipt },
  -- Typechecking
  { import = "custom.configs.tsc", enabled = typescipt },
  { import = "custom.configs.ts-autotag", enabled = typescipt },
  --Rust
  { import = "custom.configs.rustaceanvim", enabled = rust },
  -- Go Toolchain
  { import = "custom.configs.go", enabled = go },
  --Config
  -- Hyprland Treesitter
  { import = "custom.configs.hyprlang", enabled = hypr },
  -- }

  -- ── Ui ──────────────────────────────────────────────────────────{
  { import = "custom.configs.dressing", enabled = true },
  -- cool looking spinner animation for loading time
  { import = "custom.configs.fidget", enabled = ui.fidget },
  -- UI overhaul
  { import = "custom.configs.noice", enabled = ui.noice },
  -- Diagnostics and more
  { import = "custom.configs.trouble", enabled = ui.trouble },
  -- Helpful lens
  { import = "custom.configs.lsp-lens", enabled = ui.lens },
  -- Awesome UI changes based on mode
  { import = "custom.configs.reactive", enabled = ui.mode_indicator == "reactive" },
  -- change line color based on mode
  { import = "custom.configs.modicator", enabled = ui.mode_indicator == "modicator" },
  -- Eye Candy Scrolling
  { import = "custom.configs.neoscroll", enabled = ui.scroll },
  -- Better Hover
  { import = "custom.configs.hover", enabled = ui.hover },
  -- MUCH Better Hover
  { import = "custom.configs.glance", enabled = ui.glance },
  -- auto resize focused split
  { import = "custom.configs.windows", enabled = ui.split_animation },
  -- Edit fs like a buffer
  { import = "custom.configs.oil", enabled = ui.oil },
  -- Highlight occurrences of word under cursor
  { import = "custom.configs.illuminate", enabled = ui.illuminate },
  --}

  -- ── Utility ─────────────────────────────────────────────────────{
  -- Change case with Alt Shift S
  { import = "custom.configs.case-change", enabled = true },
  -- Watch where you're going
  { import = "custom.configs.numb", enabled = true },
  -- Toggle booleans with leader i
  { import = "custom.configs.toggler", enabled = true },
  -- Bring todo comments to life
  { import = "custom.configs.todo-comments", enabled = true },
  -- Eye Candy comments
  { import = "custom.configs.comment-box", enabled = true },
  -- Try this Leader f C
  { import = "custom.configs.cheatsheet", enabled = utils.cheat },
  -- keybindings
  { import = "custom.configs.hawtkeys", enabled = true },
  -- send http requests
  { import = "custom.configs.rest", enabled = utils.rest },
  -- Nerd Glyphs explorer
  { import = "custom.configs.nerdy", enabled = true },
  --}

  -- ── Motions ─────────────────────────────────────────────────────{
  -- Wings of Freedom
  { import = "custom.configs.hop", enabled = motions.hop },
  -- next level marks
  { import = "custom.configs.bookmarks", enabled = motions.bookmarks },
  -- Mark important files
  { import = "custom.configs.harpoon", enabled = motions.harpoon },
  -- jk to escape insert mode
  { import = "custom.configs.better-escape", enabled = true },
  -- Enhances Marks
  { import = "custom.configs.marks", enabled = true },
  -- Surround, Indents and Align
  { import = "custom.configs.mini", enabled = true },
  --}

  -- ── Awesome Stuff ───────────────────────────────────────────────{
  -- Load Previous Sessions
  { import = "custom.configs.persistence", enabled = x.persist },
  -- Git never been easier
  { import = "custom.configs.lazygit", enabled = x.git },
  -- project management
  { import = "custom.configs.projects", enabled = x.projects },
  -- use <number> Ctrl
  { import = "custom.configs.toggleterm", enabled = x.terms },
  -- better macro experience
  { import = "custom.configs.recorder", enabled = x.recorder },
  -- Note taking and more
  { import = "custom.configs.neorg", enabled = x.neorg },
  -- Ai
  { import = "custom.configs.gen", enabled = settings.ai.gen },
  --}

  -- ── Extra ───────────────────────────────────────────────────────{
  -- Smart Splits
  { import = "custom.configs.smart-splits", enabled = mux == "wezterm" },
  -- }
}

return plugins
-- TODO: add gen.nvim
