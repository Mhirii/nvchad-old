local M = {}

require("init")
local utils = require("utils")
local group_margin = "  "
-- M.ui = {
--   theme = "nero",
-- }

M.ui = {
	theme = "nero", -- sed mark
	-- theme = "tokyodark",
	theme_toggle = { "nero", "nero" },

	extended_integrations = { "trouble", "hop", "todo", "notify" },

	cmp = {
		style = "atom_colored", -- flatt_dark | flat_light | default | atom | atom_colored
		selected_item_bg = "colored",
	},

	transparency = false,

	hl_add = {
		FoldColumnLine = {
			fg = "grey",
			bg = "black",
		},
		FoldColumnSymbol = {
			fg = "grey_fg",
			bg = "black",
		},
		CursorLineFold = {
			fg = { "blue", 2 },
			bg = "black",
		},
	},
	hl_override = {
		FoldColumn = {
			fg = "grey",
			bg = "black",
		},
	},

	tabufline = {
		order = { "buffers", "tabs" },
	},

	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",

		overriden_modules = function(modules)
			table.insert(
				modules,
				8,
				(function()
					local hl = "%#StBg#"
					return hl .. " "
				end)()
			)

			table.insert(
				modules,
				8,
				(function()
					local hl = "%#StCodeium#"
					local icon = "" -- 󱜙  󰘦

					if utils.cmp_source("codeium") then
						icon = hl .. "󱜙" .. group_margin
					end

					return icon
				end)()
			)

			table.insert(
				modules,
				4,
				(function()
					return "%#RecordHl#" .. utils.Get_record()
				end)()
			)
		end,
	},

	nvdash = {
		load_on_startup = true,

		buttons = {
			{
				"󰁯  Restore Session",
				"Spc q l",
				function()
					require("persistence").load({ last = true })
				end,
			},
			{
				"  Zoxide",
				"Spc z x",
				":lua require('telescope').extensions.zoxide.list()",
			},
			{
				"  Find File",
				"Spc f",
				"Telescope find_files",
			},
			{
				"󰈚  Recent Files",
				"Spc s o",
				"Telescope oldfiles",
			},
			{
				"  Bookmarks",
				"Spc s m",
				"Telescope marks",
			},
			{
				"  Themes",
				"Spc t h",
				"Telescope themes",
			},
			{
				"  Config",
				"Spc o c",
				"next ~/.config/nvim/lua/custom/*.lua",
			},
			{
				"  Mappings",
				"Spc c h",
				"NvCheatsheet",
			},
		},
	},

	lsp = {
		-- show function signatures i.e args as you type
		signature = {
			disabled = false,
			silent = true, -- silences 'no signature help available' message from appearing
		},
	},
}

return M
