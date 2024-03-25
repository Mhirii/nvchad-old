require("nvchad.mappings")

local settings = require("settings")

local map = vim.keymap.set
local nomap = vim.keymap.del

-- ── unmap ─────────────────────────────────────────────────────
nomap("t", "<A-h>")
nomap("t", "<A-v>")

nomap("n", "<leader>lf")
nomap("n", "<leader>q")
nomap("n", "<A-h>")
nomap("n", "<A-v>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>sz")
nomap("n", "<leader>b")
nomap("n", "<C-n>")
nomap("n", "<leader>cm")
nomap("n", "<leader>n")
nomap("n", "<leader>pt")
nomap("n", "<leader>rn")
nomap("n", "<Tab>")
nomap("n", "<S-Tab>")

nomap("n", "<leader>fa")
nomap("n", "<leader>fb")
nomap("n", "<leader>ff")
nomap("n", "<leader>fh")
nomap("n", "<leader>fm")
nomap("n", "<leader>fo")
nomap("n", "<leader>fw")
nomap("n", "<leader>fz")

-- map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- ── General ───────────────────────────────────────────────────
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
map("v", ">", ">gv", { desc = "Indent" })

-- ── conform ───────────────────────────────────────────────────
if settings.formatter == "conform" then
	map("n", "<leader>cf", function()
		require("conform").format()
	end, { desc = "Format File" })
end

-- ── Copilot ───────────────────────────────────────────────────
if settings.ai.copilot then
	map("n", "<leader>tC", "<CMD>Copilot enable<CR>", { desc = "Copilot Enable" })
	map("n", "<leader>tc", "<CMD>Copilot disable<CR>", { desc = "Copilot Disable" })
end

-- ── Copilot Chat ──────────────────────────────────────────────
if settings.ai.copilot then
	map("n", "<A-c>", "<cmd>CopilotChat<CR>", { desc = "CopilotChat - Enable" })

	-- Show help actions with telescope
	map({ "v", "n" }, "<leader>coh", function()
		local actions = require("CopilotChat.actions")
		require("CopilotChat.integrations.telescope").pick(actions.help_actions())
	end, { desc = "CopilotChat - Help actions" })

	-- Show prompts actions with telescope
	map({ "n", "v" }, "<leader>cop", function()
		local actions = require("CopilotChat.actions")
		require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
	end, { desc = "CopilotChat - Prompt actions" })

	map(
		{ "n", "v" },
		"<leader>cop",
		":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions())<CR>",
		{ desc = "CopilotChat - Prompt actions" }
	)

	-- Code related commands
	map({ "n", "v" }, "<leader>coe", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain code" })
	map({ "n", "v" }, "<leader>cot", "<cmd>CopilotChatTests<cr>", { desc = "CopilotChat - Generate tests" })
	map({ "n", "v" }, "<leader>cor", "<cmd>CopilotChatReview<cr>", { desc = "CopilotChat - Review code" })
	map({ "n", "v" }, "<leader>coR", "<cmd>CopilotChatRefactor<cr>", { desc = "CopilotChat - Refactor code" })
	map({ "n", "v" }, "<leader>con", "<cmd>CopilotChatBetterNamings<cr>", { desc = "CopilotChat - Better Naming" })

	-- Chat with Copilot in visual mode
	map({ "n", "v" }, "<leader>cov", ":CopilotChatVisual", { desc = "CopilotChat - Open in vertical split" })
	map({ "n", "v" }, "<leader>cox", ":CopilotChatInline<cr>", { desc = "CopilotChat - Inline chat" })
	-- -- Custom input for CopilotChat
	map({ "n", "v" }, "<leader>coi", function()
		local input = vim.fn.input("Ask Copilot: ")
		if input ~= "" then
			vim.cmd("CopilotChat " .. input)
		end
	end, { desc = "CopilotChat - Ask input" })

	-- -- Quick chat with Copilot
	map({ "n", "v" }, "<leader>coq", function()
		local input = vim.fn.input("Quick Chat: ")
		if input ~= "" then
			vim.cmd("CopilotChatBuffer " .. input)
		end
	end, { desc = "CopilotChat - Quick chat" })

	-- -- Fix the issue with diagnostic
	map({ "n", "v" }, "<leader>cof", "<cmd>CopilotChatFixDiagnostic<cr>", { desc = "CopilotChat - Fix Diagnostic" })
	-- -- Clear buffer and chat history
	map(
		{ "n", "v" },
		"<leader>col",
		"<cmd>CopilotChatReset<cr>",
		{ desc = "CopilotChat - Clear buffer and chat history" }
	)
	-- -- Toggle Copilot Chat Vsplit
	map({ "n", "v" }, "<leader>cov", "<cmd>CopilotChatToggle<cr>", { desc = "CopilotChat - Toggle Vsplit" })
end

-- ── Buffer ────────────────────────────────────────────────────
map("n", "<leader>nb", "<cmd> new <CR>", { desc = "Buffer - New" })
map("n", "<leader>bd", "<cmd> q <CR>", { desc = "Buffer - Close" })

map("n", "<leader>bk", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer - Close" })

map("n", "<leader>bo", function()
	require("nvchad.tabufline").closeOtherBufs()
end, { desc = "Buffer - Close others" })

map("n", "<leader>bh", function()
	require("nvchad.tabufline").move_buf(-1)
end, { desc = "Buffer - Move left" })

map("n", "<leader>bl", function()
	require("nvchad.tabufline").move_buf(1)
end, { desc = "Buffer - Move right" })

map("n", "<S-L>", function()
	require("nvchad.tabufline").next()
end, { desc = "Buffer - Goto next" })

map("n", "<S-H>", function()
	require("nvchad.tabufline").prev()
end, { desc = "Buffer - Goto previous" })

-- ── Code ──────────────────────────────────────────────────────
map("v", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Action" })
map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Action" })

if settings.ui.inc_rename then
	map("n", "<leader>cr", ":IncRename ", { desc = "IncRename" })
else
	map("n", "<leader>cr", function()
		vim.lsp.buf.rename()
	end, { desc = "LSP rename" })
end

map("n", "<leader>cd", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Diagnostic - Open float" })

map("n", "<leader>cp", function()
	require("actions-preview").code_actions()
end, { desc = "Code Action Preview" })

-- ── Dashboard ─────────────────────────────────────────────────
map("n", "<leader>;", function()
	require("nvchad.dashboard").open()
end, { desc = "Dashboard" })

-- ── Golang ────────────────────────────────────────────────────
-- check configs/go.lua

-- ── Lazy ──────────────────────────────────────────────────────
map("n", "<leader>pl", ":Lazy<CR>", { desc = "Lazy - Open Plugin Manager" })

-- ── lsp_lines ─────────────────────────────────────────────────
if settings.utilities.lsplines then
	map("n", "<leader>ti", "<CMD>lua require('lsp_lines').toggle()<CR>", { desc = "LspLines - Toggle" })
end

-- ── Glance ────────────────────────────────────────────────────
if settings.ui.glance then
	map("n", "<leader>pd", "<CMD>Glance definitions<CR>", { desc = "Glance - definition" })
	map("n", "<leader>pr", ":Glance references<CR>", { desc = "Glance - references" })
	map("n", "<leader>pi", ":Glance implementations<CR>", { desc = "Glance - implementations" })
	map("n", "<leader>pD", ":Glance type_definitions<CR>", { desc = "Glance - Type Definitions" })
	map("n", "gR", ":Glance references<CR>", { desc = "Glance - References" })
	map("n", "gM", ":Glance implementations<CR>", { desc = "Glance - Implementations" })
	map("n", "gY", ":Glance type_definitions<CR>", { desc = "Glance - Type Definitions" })
end

-- ── Hop ───────────────────────────────────────────────────────
if settings.motions.hop then
	map("v", "<leader>hw", "<Cmd>HopWord <cr>", { desc = "Hop - Word" })
	map("v", "<leader>h/", "<Cmd>HopPattern <cr>", { desc = "Hop - Pattern" })
	map("v", "<leader>hc", "<Cmd>HopChar1 <cr>", { desc = "Hop - Character" })
	map("v", "<leader>hs", "<Cmd>HopChar2 <cr>", { desc = "Hop - 2 Characters" })
	map("v", "<M-f>", "<Cmd>HopChar1 <cr>", { desc = "Hop - Character" })

	map("n", "<leader>hw", "<Cmd>HopWord <cr>", { desc = "Hop - Word" })
	map("n", "<leader>h/", "<Cmd>HopPattern <cr>", { desc = "Hop - Pattern" })
	map("n", "<leader>hc", "<Cmd>HopChar1 <cr>", { desc = "Hop - Character" })
	map("n", "<leader>hs", "<Cmd>HopChar2 <cr>", { desc = "Hop - 2 Characters" })
	map("n", "<M-f>", "<Cmd>HopChar1CurrentLine <cr>", { desc = "Hop - Character" })
end

-- ── hover ─────────────────────────────────────────────────────
if settings.ui.hover then
	map("n", "K", function()
		require("pretty_hover").hover()
	end, { desc = "PrettyHover - Hover" })
end

-- ── lspconfig ─────────────────────────────────────────────────
map("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })

map("n", "gd", function()
	if settings.ui.trouble then
		require("trouble").toggle("lsp_definitions")
	else
		vim.lsp.buf.definition()
	end
end, { desc = "LSP definition" })

map("n", "K", function()
	vim.lsp.buf.hover()
end, { desc = "LSP hover" })

map("n", "gi", function()
	vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })

map("n", "<leader>ls", function()
	vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })

map("n", "<leader>D", function()
	vim.lsp.buf.type_definition()
end, { desc = "LSP definition type" })

map("n", "<leader>ra", function()
	require("nvchad.renamer").open()
end, { desc = "LSP rename" })

if settings.ui.trouble then
	map("n", "gr", "<CMD>Trouble lsp_references<CR>", { desc = "Trouble - References" })
else
	map("n", "gr", function()
		vim.lsp.buf.references()
	end, { desc = "LSP references" })
end

map("n", "<leader>lf", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating diagnostic" })

map("n", "[d", function()
	vim.diagnostic.goto_prev({ float = { border = "rounded" } })
end, { desc = "Goto prev" })

map("n", "]d", function()
	vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, { desc = "Goto next" })

map("n", "<leader>wa", function()
	vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder" })

map("n", "<leader>wr", function()
	vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder" })

map("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- ── harpoon ───────────────────────────────────────────────────
if settings.motions.harpoon then
	map("n", "<leader>hr", function()
		local harpoon = require("harpoon")
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "Harpoon - Toggle Menu" })
	map("n", "<leader>ha", function()
		local harpoon = require("harpoon")
		harpoon:list():append()
	end, { desc = "Harpoon - Add File" })
	map("n", "<leader>mh", function()
		local harpoon = require("harpoon")
		harpoon:list():append()
	end, { desc = "Harpoon - Add File" })
	map("n", "<leader>sh", "<cmd>Telescope harpoon marks<cr>", { desc = "Harpoon - Telescope" })
end

-- ── bookmarks ─────────────────────────────────────────────────
if settings.motions.bookmarks then
	map("n", "<leader>mb", function()
		require("bookmarks").add_bookmarks()
	end, { desc = "󰃄 Add Bookmark" })
	map("n", "<leader>mt", function()
		require("bookmarks").toggle_bookmarks()
	end, { desc = "󰧏 Toggle Bookmarks" })
end

-- ── mason ─────────────────────────────────────────────────────
map("n", "<leader>om", ":Mason<CR>", { desc = "Mason" })

-- ── multiplexer ───────────────────────────────────────────────
map("n", "<C-h>", function()
	require("smart-splits").move_cursor_left()
end, { desc = "SmartSplits - Focus Left" })
map("n", "<C-j>", function()
	require("smart-splits").move_cursor_down()
end, { desc = "SmartSplits - Focus Down" })
map("n", "<C-k>", function()
	require("smart-splits").move_cursor_up()
end, { desc = "SmartSplits - Focus Up" })
map("n", "<C-l>", function()
	require("smart-splits").move_cursor_right()
end, { desc = "SmartSplits - Focus Right" })

map("n", "<A-left>", function()
	require("smart-splits").resize_left()
end, { desc = "SmartSplits - Resize Left" })
map("n", "<A-down>", function()
	require("smart-splits").resize_down()
end, { desc = "SmartSplits - Resize Down" })
map("n", "<A-up>", function()
	require("smart-splits").resize_up()
end, { desc = "SmartSplits - Resize Up" })
map("n", "<A-right>", function()
	require("smart-splits").resize_right()
end, { desc = "SmartSplits - Resize Right" })

map("n", "<A-h>", function()
	require("smart-splits").resize_left()
end, { desc = "SmartSplits - Resize Left" })
map("n", "<A-j>", function()
	require("smart-splits").resize_down()
end, { desc = "SmartSplits - Resize Down" })
map("n", "<A-k>", function()
	require("smart-splits").resize_up()
end, { desc = "SmartSplits - Resize Up" })
map("n", "<A-l>", function()
	require("smart-splits").resize_right()
end, { desc = "SmartSplits - Resize Right" })

map("n", "<leader><leader>h", function()
	require("smart-splits").swap_buf_left()
end, { desc = "SmartSplits - Swap Buffer Left" })
map("n", "<leader><leader>j", function()
	require("smart-splits").swap_buf_down()
end, { desc = "SmartSplits - Swap Buffer Down" })
map("n", "<leader><leader>k", function()
	require("smart-splits").swap_buf_up()
end, { desc = "SmartSplits - Swap Buffer Up" })
map("n", "<leader><leader>l", function()
	require("smart-splits").swap_buf_right()
end, { desc = "SmartSplits - Swap Buffer Right" })

-- ── nerdy ─────────────────────────────────────────────────────
if settings.utilities.nerdy then
	map("n", "<leader>sn", "<cmd>Nerdy<CR>", { desc = "Telescope - Nerd Fonts" })
end

-- ── notify ────────────────────────────────────────────────────
map("n", "<leader>nd", "<cmd> NoiceDismiss <CR>", { desc = "Noice - Dismiss Notifications" })

-- ── NvimTree ──────────────────────────────────────────────────
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "NvimTree-  Toggle" })

-- ── Term ──────────────────────────────────────────────────────
map({ "n", "t" }, "<A-2>", function()
	require("nvchad.term").toggle({ pos = "vsp", id = "floatTerm", size = 0.3 })
end)
map({ "n", "t" }, "<A-1>", function()
	require("nvchad.term").toggle({ pos = "sp", id = "floatTerm", size = 0.3 })
end)
map({ "n", "t" }, "<A-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end)
-- ── oil ───────────────────────────────────────────────────────
if settings.ui.oil then
	map("n", "<leader>to", ':lua require("oil").toggle_float()<CR>', { desc = "Oil - Open Float" })
	map("n", "<leader>oi", ":Oil<CR>", { desc = "Oil - Open" })
	map("n", "<C-o>", ':lua require("oil").toggle_float()<CR>', { desc = "Oil - Open Float" })
end

-- Rest
if settings.utilities.rest then
	map("n", "<leader>ht", function()
		require("rest-nvim").run()
	end, { desc = "Rest - Run HTTP Request" })
	map("n", "<leader>hl", function()
		require("rest-nvim").last()
	end, { desc = "Rest - reRun Last HTTP Request" })
end

-- ── Telescope ─────────────────────────────────────────────────
map(
	"n",
	"<leader>f",
	"<cmd> Telescope find_files follow=true theme=dropdown previewer=false <CR>",
	{ desc = "Telescope - Find File" }
)
map(
	"n",
	"<leader>sf",
	"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
	{ desc = "Telescope - Find File" }
)
map("n", "<leader>sc", ":Telescope builtin<CR>", { desc = "Telescope - Editor Commands" })
map("n", "<leader>so", "<cmd> Telescope oldfiles<CR>", { desc = "Telescop - Old Files" })
map("n", "<leader>/", "<cmd> Telescope live_grep <CR>", { desc = "Telescop - Grep" })
map("n", "<leader>sg", "<cmd> Telescope live_grep <CR>", { desc = "Telescop - Grep" })
map(
	"n",
	"<leader>sF",
	"<cmd> Telescope current_buffer_fuzzy_find <CR>",
	{ desc = "Telescope - Find in current buffer" }
)
map("n", "<leader>sm", "<cmd> Telescope marks <CR>", { desc = "Telescope - Bookmarks" })
map("n", "<leader>sz", "<CMD>Telescope zoxide list<CR>", { desc = "Telescope - Zoxide" })
map("n", "<leader>zx", "<CMD>Telescope zoxide list<CR>", { desc = "Telescope - Zoxide" })
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope - Symbols" })
map("n", "<leader>sb", "<cmd> Telescope buffers <CR>", { desc = "Telescope - Buffers" })
map("n", "<leader>sl", "<cmd>Telescope resume<cr>", { desc = "Telescope - Resume last search" })

map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope - LSP References" })
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope - LSP references" })
map("n", "<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope - recent files" })

map("n", "<leader>sk", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope - Find in current buffer" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope - Git Commits" })
map("n", "<leader>st", "<cmd>Telescope terms<CR>", { desc = "Telescope - Pick Hidden Term" })

map(
	"n",
	"<leader>sa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Telescope - Find all files" }
)

-- ── Todo ──────────────────────────────────────────────────────
map("n", "<leader>sd", "<cmd>TodoTelescope<cr>", { desc = "Telescope - TODOs" })

-- ── Toggle ────────────────────────────────────────────────────
local toggled = false
map("n", "<leader>ta", function()
	vim.opt.concealcursor = "nc"
	if toggled then
		vim.opt.conceallevel = 0
		toggled = false
	else
		vim.opt.conceallevel = 2
		toggled = true
	end
end, { desc = "Toggle Conceal" })
map("n", "<leader>tnl", "<cmd> set nu! <CR>", { desc = "Toggle - Line Number" })
map("n", "<leader>tnr", "<cmd> set rnu! <CR>", { desc = "Toggle - Relative Number" })
map("n", "<leader>tD", function()
	require("gitsigns").toggle_deleted()
end, { desc = "GitSigns - Toggle deleted" })
map("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Nvchad - Themes" })
map("n", "<leader>ts", function()
	require("base46").toggle_transparency()
end, { desc = "Nvchad - Toggle Transparency" })
map("n", "<leader>tt", function()
	require("base46").toggle_theme()
end, { desc = "Term - Toggle theme" })

-- ── Trouble ───────────────────────────────────────────────────
if settings.ui.trouble then
	map("n", "<leader>tr", ":TroubleToggle<CR>", { desc = "Trouble - Toggle" })
	map("n", "<leader>wd", ":TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble - Workspace Diagnostics" })
	map("n", "<leader>cq", "<CMD>TroubleToggle quickfix<CR>", { desc = "Trouble - Quickfix" })
	map("n", "<leader>td", "<CMD>TodoTrouble<CR>", { desc = "Trouble - Todo" })
	map("n", "gd", "<CMD>Trouble lsp_definitions<CR>", { desc = "Trouble - Definition" })
	map("n", "gi", "<CMD>Trouble lsp_implementations<CR>", { desc = "Trouble - Implementations" })
	map("n", "gD", "<CMD>Trouble lsp_type_definitions<CR>", { desc = "Trouble - Type Definition" })
end

-- ── Window ────────────────────────────────────────────────────

map("n", "<leader>|", "<CMD>vs <CR>", { desc = "Split - Vertical" })
map("n", "<leader>-", "<CMD>sp <CR>", { desc = "Split - Horizontal" })

-- global lsp mappings
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Diagnostic - Floating" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic - Loclist" })

-- Comment
map("n", "<C-/>", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Comment - Toggle" })

map(
	"v",
	"<C-/>",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Comment - Toggle" }
)

-- terminal
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

-- toggleable
map("t", "<ESC>", function()
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_close(win, true)
end, { desc = "Terminal - Close term in terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey - all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "Whichkey - query lookup" })

-- blankline
map("n", "<leader>cc", function()
	local config = { scope = {} }
	config.scope.exclude = { language = {}, node_type = {} }
	config.scope.include = { node_type = {} }
	local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

	if node then
		local start_row, _, end_row, _ = node:range()
		if start_row ~= end_row then
			vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
			vim.api.nvim_feedkeys("_", "n", true)
		end
	end
end, { desc = "Blankline - Jump to current context" })

nomap("n", "<leader>cc")
nomap("t", "<ESC>")
