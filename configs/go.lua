return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		require("go").setup({
			lsp_cfg = {
				capabilities = capabilities,
				-- other setups
			},
			max_line_len = 300,
			lsp_inlay_hints = {
				enable = true,
				only_current_line = true,
				other_hints_prefix = "•",
			},
			trouble = true,
			lsp_keymaps = false,
			diagnostic = {
				hdlr = true,
				underline = true,
				virtual_text = false,
				signs = true,
				update_in_insert = false,
			},
			icons = { breakpoint = "", currentpos = "" },
			gocoverage_sign = "│",
			luasnip = true,
			lsp_codelens = true,
		})

		require("core.utils").load_mappings("golang")

		local wk = require("which-key")
		local icons = require("icons")
		wk.register({
			["<leader>"] = {
				a = { name = "󰟓 Actions" },
				at = { name = icons.kind.Event .. " Test" },
			},
		})

		local map = vim.keymap.set
		map("n", "<leader>cr", "<CMD>GoRename<CR>", { desc = "󰟓 Rename" })
		map("n", "<leader>cl", "<CMD>GoCodeLenAct<CR>", { desc = "󰟓 Code Lens This Line" })
		map("n", "<leader>ln", "<CMD>GoLint<CR>", { desc = "󰟓 Lint" })

		map("n", "<leader>ab", "<CMD>GoBuild<CR>", { desc = icons.ui.Gear .. " Build" })
		map("n", "<leader>ar", "<CMD>GoRun<CR>", { desc = icons.ui.Triangle .. " Run" })

		map("n", "<leader>atb", "<CMD>GoTestFile<CR>", { desc = icons.ui.File .. " Test this File" })
		map("n", "<leader>atp", "<CMD>GoTestPkg<CR>", { desc = icons.kind.Package .. " Test this Package" })
		map("n", "<leader>atf", "<CMD>GoTestFunc<CR>", { desc = icons.kind.Function .. " Test this Function" })
		map("n", "<leader>ata", "<CMD>GoAddTest<CR>", { desc = icons.ui.Action .. " Add Test for this Function" })
		map("n", "<leader>ate", "<CMD>GoAddAllTest<CR>", { desc = icons.ui.Action .. " Add Tests for all Functions" })
		map("n", "<leader>ac", "<CMD>GoCheat<CR>", { desc = icons.ui.Book .. " Cheatsheet" })
		map("n", "<leader>al", "<CMD>GoLint<CR>", { desc = icons.ui.Watches .. " Lint" })
		map("n", "<leader>as", "<CMD>GoCodeLenAct<CR>", { desc = icons.ui.Fire .. " Code Lens This Line" })
		map("n", "<leader>ah", "<CMD>GoToggleInlay<CR>", { desc = icons.diagnostics.Hint .. " Inlay Hints" })

		map("n", "]d", function()
			vim.diagnostic.goto_prev({ float = { border = "rounded" } })
		end, { desc = "Goto prev" })
		map("n", "[d", function()
			vim.diagnostic.goto_next({ float = { border = "rounded" } })
		end, { desc = "Goto next" })
		map("n", "K", "<CMD>GoDoc<CR>", { desc = "Go Hover" })
	end,
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
