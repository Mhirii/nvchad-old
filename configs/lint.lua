return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			typescript = { "biomejs" },
			bash = { "shellcheck" },
			go = { "golangcilint" },
			fish = { "fish" },
			vue = { "eslint" },
		}
	end,
}
