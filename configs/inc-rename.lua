local settings = require("settings")
return {
	"smjonas/inc-rename.nvim",
	event = "VeryLazy",
	config = function()
		if settings.ui.noice then
			require("inc_rename").setup()
		else
			require("inc_rename").setup({
				input_buffer_type = "dressing",
			})
		end
	end,
}
