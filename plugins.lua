local settings = require "custom.settings"
local typescipt = settings.lang.typescript
local rust = settings.lang.rust
local motions = settings.motions
local ui = settings.ui
local formatter = settings.formatter
local mux = settings.multiplexer
local hypr = settings.hyprland

---@type NvPluginSpec[]
local plugins = {

  -- ── Overrides ───────────────────────────────────────────────────{
  { import = "custom.overrides.lspconfig" },
  { import = "custom.overrides.mason" },
  { import = "custom.overrides.treesitter" },
  { import = "custom.overrides.nvimtree" },
  { import = "custom.overrides.telescope" },
  { import = "custom.overrides.cmp" },
  { import = "custom.overrides.whichkey" },
  { "stevearc/conform.nvim", enabled = formatter == "conform" },
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
  { import = "custom.configs.lsp-zero", enabled = true },
  {
    import = "custom.configs.context-vt",
    enabled = ui.context,
    desc = " useful in nested code",
  },
  { import = "custom.configs.actions-preview", enabled = ui.code_actions, desc = " leader c p" },
  { import = "custom.configs.aerial", enabled = true, desc = " Buffer Navigation" },
  { import = "custom.configs.refactoring", enabled = true, desc = " Refactoring" },
  {
    import = "custom.configs.lsplines",
    enabled = true,
    desc = " Explanation Lines below errors",
  },
  --}

  -- ── Lang ────────────────────────────────────────────────────────{
  -- typescipt
  { import = "custom.configs.ts", enabled = typescipt },
  { import = "custom.configs.tsc", enabled = typescipt },
  { import = "custom.configs.ts-autotag", enabled = typescipt },
  --Rust
  { import = "custom.configs.rustaceanvim", enabled = rust, desc = " Rust" },
  --Go
  --Config
  {
    import = "custom.configs.hyprlang",
    enabled = hypr,
    desc = " Hyprland Treesitter",
  },
  -- }

  -- ── Ui ──────────────────────────────────────────────────────────{
  { import = "custom.configs.dressing", enabled = true, desc = " UI" },
  { import = "custom.configs.fidget", enabled = false, desc = " UI" },
  { import = "custom.configs.noice", enabled = true, desc = " UI" },
  {
    import = "custom.configs.trouble",
    enabled = true,
    desc = " Diagnostics and more",
  },
  { import = "custom.configs.lsp-lens", enabled = true, desc = " Helpful lens" },
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
  { import = "custom.configs.neoscroll", enabled = true, desc = " Eye Candy Scrolling" },
  { import = "custom.configs.numb", enabled = true, desc = " Watch where you're going" },
  { import = "custom.configs.hover", enabled = true, desc = " Better Hover" },
  { import = "custom.configs.windows", enabled = ui.split_animation, desc = " auto resize focused split" },
  --}

  -- ── Utility ─────────────────────────────────────────────────────{
  { import = "custom.configs.case-change", enabled = true, desc = " Change case with Alt Shift S" },
  { import = "custom.configs.toggler", enabled = true, desc = " Toggle booleans with leader i" },
  { import = "custom.configs.todo-comments", enabled = true, desc = " Bring todo comments to life" },
  { import = "custom.configs.comment-box", enabled = true, desc = " Eye Candy comments" },
  { import = "custom.configs.cheatsheet", enabled = true, desc = " Try this Leader f C" },
  { import = "custom.configs.hawtkeys", enabled = true, desc = " keybindings" },
  --}

  -- ── Motions ─────────────────────────────────────────────────────{
  { import = "custom.configs.hop", enabled = motions.hop, desc = " Wings of Freedom" },
  { import = "custom.configs.bookmarks", enabled = motions.bookmarks, desc = " next level marks" },
  { import = "custom.configs.harpoon", enabled = motions.harpoon, desc = " Mark important files" },
  { import = "custom.configs.better-escape", enabled = true, desc = " jk to escape insert mode" },
  { import = "custom.configs.marks", enabled = true, desc = " Enhances Marks" },
  { import = "custom.configs.mini", enabled = true, desc = " Surround, Indents and Align" },
  --}

  -- ── Awesome Stuff ───────────────────────────────────────────────{
  { import = "custom.configs.persistence", enabled = true, desc = " Load Previous Sessions" },
  { import = "custom.configs.lazygit", enabled = true, desc = " Git never been easier" },
  { import = "custom.configs.projects", enabled = true, desc = " project management" },
  { import = "custom.configs.toggleterm", enabled = true, desc = " use <number> Ctrl  " },
  --}

  -- ── Multiplexer ─────────────────────────────────────────────────{
  { import = "custom.configs.smart-splits", enabled = mux == "wezterm", desc = " Smart Splits" },
  -- }
}

-- { -- TODO: tmux
--   "alexghergh/nvim-tmux-navigation",
--   event = "VeryLazy",
--   opts = {
--     keybindings = {
--       left = "<C-h>",
--       down = "<C-j>",
--       up = "<C-k>",
--       right = "<C-l>",
--       last_active = "<C-\\>",
--     },
--   },
-- },

-- TODO: rktjmp/paperplanes.nvim,
-- TODO: Wezterm

return plugins
