local overrides = require "custom.configs.overrides"

local settings = require "custom.settings"
local typescipt = settings.lang.typescript
local motions = settings.motions
local ui = settings.ui
local formatter = settings.formatter

---@type NvPluginSpec[]
local plugins = {

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                        Overrides                        │
  --          ╰─────────────────────────────────────────────────────────╯

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
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
    end, -- Override to setup mason-lspconfig
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
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
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

  -- ── Lsp ─────────────────────────────────────────────────────────

  { import = "custom.configs.context-vt",      enabled = true },
  { import = "custom.configs.actions-preview", enabled = true },
  { import = "custom.configs.ts",              enabled = typescipt },
  { import = "custom.configs.tsc",             enabled = typescipt },

  -- ── Ui ──────────────────────────────────────────────────────────

  { import = "custom.configs.dressing",        enabled = true },
  { import = "custom.configs.neoscroll",       enabled = true },
  { import = "custom.configs.aerial",          enabled = true },
  { import = "custom.configs.trouble",         enabled = true },
  { import = "custom.configs.lsp-lens",        enabled = true },
  { import = "custom.configs.modicator",       enabled = true },
  { import = "custom.configs.numb",            enabled = true },

  -- ── Utility ─────────────────────────────────────────────────────

  { import = "custom.configs.case-change",     enabled = true },
  { import = "custom.configs.toggler",         enabled = true },
  { import = "custom.configs.todo-comments",   enabled = true },
  { import = "custom.configs.comment-box",     enabled = true },
  { import = "custom.configs.cheatsheet",      enabled = true },

  -- ── Motions ─────────────────────────────────────────────────────

  { import = "custom.configs.hop",             enabled = motions.hop },
  { import = "custom.configs.bookmarks",       enabled = motions.bookmarks },
  { import = "custom.configs.harpoon",         enabled = motions.harpoon },
  { import = "custom.configs.better-escape",   enabled = true },
  { import = "custom.configs.marks",           enabled = true },
  { import = "custom.configs.mini",            enabled = true },

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

  -- ── Awesome ─────────────────────────────────────────────────────

  { import = "custom.configs.persistence",     enabled = true },
  { import = "custom.configs.lazygit",         enabled = true },
  { import = "custom.configs.projects",        enabled = true },
  { import = "custom.configs.toggleterm",      enabled = true },
}

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
