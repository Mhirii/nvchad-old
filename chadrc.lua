local M = {}

require("init")
local utils = require("utils")
local group_margin = "  "

M.ui = {
	theme = "nero", -- sed mark
	-- theme = "nero",
	theme_toggle = { "nero", "nero" },

	cmp = {
		style = "atom_colored", -- flatt_dark | flat_light | default | atom | atom_colored
		selected_item_bg = "colored",
	},

	transparency = false,

	hl_add = {
		FoldColumnLine = { fg = "grey", bg = "black" },
		FoldColumnSymbol = { fg = "grey_fg", bg = "black" },
		CursorLineFold = { fg = { "blue", 2 }, bg = "black" },
		DiagnosticError = { fg = "red", bg = "black" },
		DiagnosticWarn = { fg = "orange", bg = "black" },
		DiagnosticInfo = { fg = "blue", bg = "black" },
		DiagnosticHint = { fg = "green", bg = "black" },
		Identifier = { fg = "purple", bg = "black" },
	},

	hl_override = {
		FoldColumn = { fg = "grey", bg = "black" },
		Folded = {
			fg = "light_grey",
			bg = "black2",
		},
		NvDashAscii = {
			fg = "blue",
			bg = "black",
		},

		NvDashButtons = {
			fg = "white",
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

		header = {
			-- "           ▄ ▄                   ",
			-- "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
			-- "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
			-- "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
			-- "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
			-- "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
			-- "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
			-- "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
			-- "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
			"                                                                     ",
			"                                                                   ",
			"      ████ ██████           █████      ██                    ",
			"     ███████████             █████                            ",
			"     █████████ ███████████████████ ███   ███████████  ",
			"    █████████  ███    █████████████ █████ ██████████████  ",
			"   █████████ ██████████ █████████ █████ █████ ████ █████  ",
			" ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
			"██████  █████████████████████ ████ █████ █████ ████ ██████",
			"                                                                     ",
		},

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
		},
	},

	lsp = {
		-- show function signatures i.e args as you type
		signature = true,
		semantic_tokens = false,
	},

	term = {
		-- hl = "Normal:term,WinSeparator:WinSeparator",
		sizes = { sp = 0.3, vsp = 0.2 },
		float = {
			relative = "editor",
			row = 0.1,
			col = 0.1,
			width = 0.8,
			height = 0.7,
			border = "single",
		},
	},
}

return M
