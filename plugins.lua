local settings = require "custom.settings"
local typescipt = settings.lang.typescript
local rust = settings.lang.rust
local go = settings.lang.go
local motions = settings.motions
local ui = settings.ui
local formatter = settings.formatter
local mux = settings.multiplexer
local hypr = settings.hyprland
local utils = settings.utilities

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

  { "stevearc/conform.nvim",               enabled = formatter == "conform" },
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
  { import = "custom.configs.lsp-zero",        enabled = settings.lspzero },
  {
    import = "custom.configs.context-vt",
    enabled = ui.context,
    desc = " useful in nested code",
  },
  { import = "custom.configs.actions-preview", enabled = ui.code_actions, desc = " leader c p" },
  { import = "custom.configs.aerial",          enabled = utils.aerial,    desc = " Buffer Navigation" },
  { import = "custom.configs.refactoring",     enabled = true,            desc = " Refactoring" },
  {
    import = "custom.configs.lsplines",
    enabled = utils.lsplines,
    desc = " Explanation Lines below errors",
  },
  --}

  -- ── Lang ────────────────────────────────────────────────────────{
  -- typescipt
  { import = "custom.configs.ts",           enabled = typescipt },
  { import = "custom.configs.tsc",          enabled = typescipt },
  { import = "custom.configs.ts-autotag",   enabled = typescipt },
  --Rust
  { import = "custom.configs.rustaceanvim", enabled = rust,     desc = " Rust" },
  --Go
  { import = "custom.configs.go",           enabled = go,       desc = " Go Toolchain" },
  --Config
  {
    import = "custom.configs.hyprlang",
    enabled = hypr,
    desc = " Hyprland Treesitter",
  },
  -- }

  -- ── Ui ──────────────────────────────────────────────────────────{
  { import = "custom.configs.dressing", enabled = true,  desc = " UI" },
  { import = "custom.configs.fidget",   enabled = false, desc = " UI" },
  { import = "custom.configs.noice",    enabled = true,  desc = " UI" },
  {
    import = "custom.configs.trouble",
    enabled = ui.trouble,
    desc = " Diagnostics and more",
  },
  { import = "custom.configs.lsp-lens",      enabled = ui.lens,            desc = " Helpful lens" },
  {
    import = "custom.configs.reactive",
    enabled = ui.mode_indicator == "reactive",
    desc = "Awesome UI changes based on mode",
  },
  {
    import = "custom.configs.modicator",
    enabled = ui.mode_indicator == "modicator",
    desc = " change line color based on mode",
  },
  { import = "custom.configs.neoscroll",     enabled = ui.scroll,          desc = " Eye Candy Scrolling" },
  { import = "custom.configs.numb",          enabled = true,               desc = " Watch where you're going" },
  { import = "custom.configs.hover",         enabled = ui.hover,           desc = " Better Hover" },
  { import = "custom.configs.glance",        enabled = ui.glance,          desc = " MUCH Better Hover" },
  { import = "custom.configs.windows",       enabled = ui.split_animation, desc = " auto resize focused split" },
  { import = "custom.configs.oil",           enabled = ui.oil,             desc = " Edit fs like a buffer" },
  --}

  -- ── Utility ─────────────────────────────────────────────────────{
  { import = "custom.configs.case-change",   enabled = true,               desc = " Change case with Alt Shift S" },
  { import = "custom.configs.toggler",       enabled = true,               desc = " Toggle booleans with leader i" },
  { import = "custom.configs.todo-comments", enabled = true,               desc = " Bring todo comments to life" },
  { import = "custom.configs.comment-box",   enabled = true,               desc = " Eye Candy comments" },
  { import = "custom.configs.cheatsheet",    enabled = true,               desc = " Try this Leader f C" },
  { import = "custom.configs.hawtkeys",      enabled = true,               desc = " keybindings" },
  { import = "custom.configs.rest",          enabled = utils.rest,         desc = " send http requests" },
  --}

  -- ── Motions ─────────────────────────────────────────────────────{
  { import = "custom.configs.hop",           enabled = motions.hop,        desc = " Wings of Freedom" },
  { import = "custom.configs.bookmarks",     enabled = motions.bookmarks,  desc = " next level marks" },
  { import = "custom.configs.harpoon",       enabled = motions.harpoon,    desc = " Mark important files" },
  { import = "custom.configs.better-escape", enabled = true,               desc = " jk to escape insert mode" },
  { import = "custom.configs.marks",         enabled = true,               desc = " Enhances Marks" },
  { import = "custom.configs.mini",          enabled = true,               desc = " Surround, Indents and Align" },
  --}

  -- ── Awesome Stuff ───────────────────────────────────────────────{
  { import = "custom.configs.persistence",   enabled = true,               desc = " Load Previous Sessions" },
  { import = "custom.configs.lazygit",       enabled = true,               desc = " Git never been easier" },
  { import = "custom.configs.projects",      enabled = true,               desc = " project management" },
  { import = "custom.configs.toggleterm",    enabled = true,               desc = " use <number> Ctrl  " },
  { import = "custom.configs.recorder",      enabled = true,               desc = " better macro experience" },
  --}

  -- ── Extra ───────────────────────────────────────────────────────{
  { import = "custom.configs.smart-splits",  enabled = mux == "wezterm",   desc = " Smart Splits" },
  { import = "custom.configs.neorg",         enabled = settings.neorg,     desc = " Note taking and more" },
  -- }
}

-- TODO: rktjmp/paperplanes.nvim,

return plugins
