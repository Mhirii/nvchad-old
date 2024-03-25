local M = {}

M.lang = { -- TODO: add cpp
	typescript = true,
	rust = true,
	go = true,
	cpp = false,
	hyprland = true,
}

M.lint = true

M.fold = {
	ufo = true,
}

M.ui = {
	tree = "nvimtree",
	oil = true,
	trouble = true,
	inc_rename = true,
	bqf = false,
	code_actions = true,
	scroll = true,
	context = true,
	lens = true,
	split_animation = true,
	mode_indicator = "reactive", -- modicator or reactive
	hover = false,
	glance = true,
	notify = true,
	noice = true,
	illuminate = true,
}

M.ai = {
	codeium = false,
	copilot = true,
	copilot_cmp = true,
	copilot_chat = true,
}

M.motions = {
	harpoon = true,
	bookmarks = true,
	hop = true,
}

M.utilities = {
	aerial = true,
	lsplines = true,
	rest = true,
	nerdy = true,
}

M.multiplexer = "wezterm" -- wezterm | tmux -- edit: the plugin works well with both

M.formatter = "conform" -- none-ls | conform. TODO: Configure conform and lint

M.refactoring = false

M.extras = {
	persist = true,
	git = true,
	terms = false,
	neorg = true,
}

return M
