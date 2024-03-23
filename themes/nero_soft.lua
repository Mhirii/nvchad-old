-- credits to original theme for existing https://github.com/BeardedBear/bearded-theme ( arc version )
-- This is just a modified version of it

local M = {}

M.base_30 = {
	white = "#c5d8ef",
	darker_black = "#0b1928",
	black = "#0d1c2e", -- nvim bg
	black2 = "#12243a",
	one_bg = "#14273d",
	one_bg2 = "#1c314a",
	one_bg3 = "#223b58",
	grey = "#2a4465",
	grey_fg = "#314e72",
	grey_fg2 = "#385880",
	light_grey = "#40628c",
	red = "#FF738A",
	baby_pink = "#F38CEC",
	pink = "#ee9cdd",
	line = "#1c314a", -- for lines like vertsplit
	green = "#3CEC85",
	vibrant_green = "#9bdead",
	nord_blue = "#69C3FF",
	blue = "#42baf0",
	yellow = "#EACD61",
	sun = "#f6d96d",
	purple = "#bd93ff",
	dark_purple = "#B78AFF",
	teal = "#12c7c4",
	orange = "#FF955C",
	cyan = "#22ECDB",
	statusline_bg = "#12243a",
	lightbg = "#1c314a",
	pmenu_bg = "#12c7c4",
	folder_bg = "#42baf0",
}

M.base_16 = {
	base00 = "#0d1c2e",
	base01 = "#14273d",
	base02 = "#1c314a",
	base03 = "#2a4465",
	base04 = "#b4cce9",
	base05 = "#eaf1fa",
	base06 = "#c5d8ef",
	base07 = "#08bdba",
	base08 = "#42baf0",
	base09 = "#FF738A",
	base0A = "#3CEC85",
	base0B = "#EACD61",
	base0C = "#42baf0",
	base0D = "#22ECDB",
	base0E = "#B78AFF",
	base0F = "#22ECDB",
}

M.type = "dark"

M.polish_hl = {
	treesitter = {
		["@attribute"] = { fg = M.base_30.purple },
		["@property"] = { fg = M.base_30.teal },

		["@function"] = { fg = M.base_30.cyan },
		["@function.builtin"] = { fg = M.base_30.cyan },
		["@function.macro"] = { fg = M.base_30.blue },
		["@function.call"] = { fg = M.base_30.yellow },
		["@function.method"] = { fg = M.base_30.cyan },
		["@function.method.call"] = { fg = M.base_30.yellow },

		["@variable"] = { fg = M.base_16.base05 },
		["@variable.builtin"] = { fg = M.base_16.base09 },
		["@variable.parameter"] = { fg = M.base_16.base08 },
		["@variable.member"] = { fg = M.base_30.teal },
		["@variable.member.key"] = { fg = M.base_30.teal },
	},
}

return M
