local overrides = require "custom.configs.overrides"

local settings = require "custom.settings"
local typescipt = settings.lang.typescript
local motions = settings.motions
local ui = settings.ui
local formatter = settings.formatter

---@type NvPluginSpec[]
local plugins = {
  -- ── Overrides ───────────────────────────────────────────────────{
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        opts = function()
          return require "custom.configs.null-ls"
        end,
        enabled = formatter == "none-ls",
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
    enabled = formatter == "none-ls",
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    enabled = ui.tree == "nvimtree",
  },
  {
    "stevearc/conform.nvim",
    enabled = formatter == "conform",
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    event = "BufRead",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = require("custom.configs.cmp").dependencies,
    opts = require("custom.configs.cmp").opts,
  },
  { import = "custom.configs.telescope" },
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      require("custom.configs.whichkey").prefixes()
    end,
    opts = require("custom.configs.whichkey").opts,
  },
  --}

  -- ── Lsp ─────────────────────────────────────────────────────────{
  { import = "custom.configs.context-vt",      enabled = ui.context,        desc = " useful in nested code" },
  { import = "custom.configs.actions-preview", enabled = ui.code_actions,   desc = " leader c p" },
  { import = "custom.configs.aerial",          enabled = true,              desc = " Navigate your buffer seamlessly" },
  { import = "custom.configs.refactoring",     enabled = true,              desc = " Refactoring" },
  --}

  -- ── Lang ────────────────────────────────────────────────────────{
  -- typescipt
  { import = "custom.configs.ts",              enabled = typescipt },
  { import = "custom.configs.tsc",             enabled = typescipt },
  --Rust
  --Go
  -- }

  -- ── Ui ──────────────────────────────────────────────────────────{
  { import = "custom.configs.dressing",        enabled = true,              desc = " UI" },
  { import = "custom.configs.trouble",         enabled = true,              desc = " Diagnostics and more" },
  { import = "custom.configs.lsp-lens",        enabled = true,              desc = " Reference count above functions" },
  { import = "custom.configs.modicator",       enabled = true,              desc = " change line color based on mode" },
  { import = "custom.configs.neoscroll",       enabled = true,              desc = " Eye Candy Scrolling" },
  { import = "custom.configs.numb",            enabled = true,              desc = " Watch where you're going" },
  --}

  -- ── Utility ─────────────────────────────────────────────────────{
  { import = "custom.configs.case-change",     enabled = true,              desc = " Change case with Alt Shift S" },
  { import = "custom.configs.toggler",         enabled = true,              desc = " Toggle booleans with Leader i" },
  { import = "custom.configs.todo-comments",   enabled = true,              desc = " Bring todo comments to life" },
  { import = "custom.configs.comment-box",     enabled = true,              desc = " Eye Candy comments" },
  { import = "custom.configs.cheatsheet",      enabled = true,              desc = " Try this Leader f C" },
  --}

  -- ── Motions ─────────────────────────────────────────────────────{
  { import = "custom.configs.hop",             enabled = motions.hop,       desc = "Wings of Freedom" },
  { import = "custom.configs.bookmarks",       enabled = motions.bookmarks, desc = " next level marks" },
  { import = "custom.configs.harpoon",         enabled = motions.harpoon,   desc = " Mark important files" },
  { import = "custom.configs.better-escape",   enabled = true,              desc = " jk to escape insert mode" },
  { import = "custom.configs.marks",           enabled = true,              desc = " Enhances Marks" },
  { import = "custom.configs.mini",            enabled = true,              desc = " Surround, Indents and Align" },
  --}

  -- ── Awesome Stuff ───────────────────────────────────────────────{
  { import = "custom.configs.persistence",     enabled = true,              desc = " Load Previous Sessions" },
  { import = "custom.configs.lazygit",         enabled = true,              desc = " Git never been easier" },
  {
    import = "custom.configs.projects",
    enabled = true,
    desc = " leader f p to access your projects",
  },
  {
    import = "custom.configs.toggleterm",
    enabled = true,
    desc = " self explanatory, use <number> Ctrl  ",
  },
  --}
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

-- {  -- TODO:
--   "rktjmp/paperplanes.nvim",
--   event = "VeryLazy",
--   keys = require("custom.configs.paperplanes").keys,
--   config = function(_, opts)
--     require("paperplanes").setup(opts)
--   end,
--   opts = require("custom.configs.paperplanes").opts,
-- },

return plugins
