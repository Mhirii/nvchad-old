local settings = require("settings")
local typescipt = settings.lang.typescript
local rust = settings.lang.rust
local go = settings.lang.go
local hypr = settings.lang.hyprland
local motions = settings.motions
local ui = settings.ui
local mux = settings.multiplexer
local utils = settings.utilities
local x = settings.extras

return {
	-- {
	--   "stevearc/conform.nvim",
	--   config = function()
	--     require "configs.conform"
	--   end,
	-- },

	-- ── Overrides ───────────────────────────────────────────────────{
	{ import = "overrides.lspconfig" },
	{ import = "overrides.mason" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ import = "overrides.treesitter" },
	{ import = "overrides.nvimtree" },
	{ import = "overrides.telescope" },
	{ import = "overrides.cmp" },
	{ import = "overrides.whichkey" },
	-- { import = "overrides.nvterm" },
	{ import = "overrides.conform", enabled = settings.formatter == "conform" },
	--}
	-- ── Lsp ─────────────────────────────────────────────────────────{
	{ import = "configs.lsp-zero", enabled = settings.lspzero },
	--" useful in nested code"
	{ import = "configs.context-vt", enabled = ui.context },
	-- leader c p
	{ import = "configs.actions-preview", enabled = ui.code_actions },
	-- Buffer Navigation
	{ import = "configs.aerial", enabled = utils.aerial },
	-- Refactoring
	{ import = "configs.refactoring", enabled = settings.refactoring },
	-- Explanation Lines below errors
	{ import = "configs.lsplines", enabled = utils.lsplines },
	-- Lint
	{ import = "configs.lint", enabled = settings.lint },
	-- Rename
	{ import = "configs.inc-rename", enabled = ui.inc_rename },
	--}

	-- ── Lang ────────────────────────────────────────────────────────{
	-- typescipt
	{ import = "configs.ts", enabled = typescipt },
	{ import = "configs.imports", enabled = typescipt },
	{ import = "configs.error-translator", enabled = typescipt },
	{ import = "configs.autoFoldImports", enabled = typescipt },
	-- Typechecking
	{ import = "configs.tsc", enabled = typescipt },
	{ import = "configs.ts-autotag", enabled = typescipt },
	--Rust
	{ import = "configs.rustaceanvim", enabled = rust },
	-- Go Toolchain
	{ import = "configs.go", enabled = go },
	--Config
	-- Hyprland Treesitter
	{ import = "configs.hyprlang", enabled = hypr },
	-- }

	-- ── Ui ──────────────────────────────────────────────────────────{
	{ import = "configs.dressing", enabled = true },
	-- cool looking spinner animation for loading time
	{ import = "configs.fidget", enabled = ui.fidget },
	-- UI overhaul
	{ import = "configs.noice", enabled = ui.noice },
	-- Diagnostics and more
	{ import = "configs.trouble", enabled = ui.trouble },
	{ import = "configs.bqf", enabled = ui.bqf },
	-- Helpful lens
	{ import = "configs.lsp-lens", enabled = ui.lens },
	-- Awesome UI changes based on mode
	{ import = "configs.reactive", enabled = ui.mode_indicator == "reactive" },
	-- change line color based on mode
	{ import = "configs.modicator", enabled = ui.mode_indicator == "modicator" },
	-- Eye Candy Scrolling
	{ import = "configs.neoscroll", enabled = ui.scroll },
	-- Better Hover
	{ import = "configs.hover", enabled = ui.hover },
	-- MUCH Better Hover
	{ import = "configs.glance", enabled = ui.glance },
	-- auto resize focused split
	{ import = "configs.windows", enabled = ui.split_animation },
	-- Edit fs like a buffer
	{ import = "configs.oil", enabled = ui.oil },
	-- Highlight occurrences of word under cursor
	{ import = "configs.illuminate", enabled = ui.illuminate },
	--}

	-- ── Fold ──────────────────────────────────────────────────────{
	{ import = "configs.ufo", enabled = settings.fold.ufo },
	-- }

	-- ── Utility ─────────────────────────────────────────────────────{
	-- Change case with Alt Shift S
	{ import = "configs.case-change", enabled = true },
	-- Watch where you're going
	{ import = "configs.numb", enabled = true },
	-- Toggle booleans with leader i
	{ import = "configs.toggler", enabled = true },
	-- Bring todo comments to life
	{ import = "configs.todo-comments", enabled = true },
	-- Eye Candy comments
	{ import = "configs.comment-box", enabled = true },
	-- Try this Leader f C
	{ import = "configs.cheatsheet", enabled = utils.cheat },
	-- keybindings
	{ import = "configs.hawtkeys", enabled = true },
	-- send http requests
	{ import = "configs.rest", enabled = utils.rest },
	-- Nerd Glyphs explorer
	{ import = "configs.nerdy", enabled = true },
	--}

	-- ── Motions ─────────────────────────────────────────────────────{
	-- Wings of Freedom
	{ import = "configs.hop", enabled = motions.hop },
	-- next level marks
	{ import = "configs.bookmarks", enabled = motions.bookmarks },
	-- Mark important files
	{ import = "configs.harpoon", enabled = motions.harpoon },
	-- jk to escape insert mode
	{ import = "configs.better-escape", enabled = true },
	-- Enhances Marks
	{ import = "configs.marks", enabled = true },
	-- Surround, Indents and Align
	{ import = "configs.mini", enabled = true },
	--}

	-- ── Awesome Stuff ───────────────────────────────────────────────{
	-- Load Previous Sessions
	{ import = "configs.persistence", enabled = x.persist },
	-- Git never been easier
	{ import = "configs.lazygit", enabled = x.git },
	-- project management
	{ import = "configs.projects", enabled = x.projects },
	-- use <number> Ctrl
	{ import = "configs.toggleterm", enabled = x.terms },
	-- better macro experience
	{ import = "configs.recorder", enabled = x.recorder },
	-- Note taking and more
	{ import = "configs.neorg", enabled = x.neorg },
	-- Ai
	{ import = "configs.gen", enabled = settings.ai.gen },
	--}

	-- ── Extra ───────────────────────────────────────────────────────{
	-- Smart Splits
	{ import = "configs.smart-splits", enabled = mux == "wezterm" },
	-- Copilot
	{ import = "configs.copilot", enabled = settings.ai.copilot },
	{ import = "configs.copilot-chat", enabled = settings.ai.copilot_chat },
	-- }
}
