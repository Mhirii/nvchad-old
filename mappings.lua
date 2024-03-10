require("nvchad.mappings")

local icons = require("icons")
local settings = require("settings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- ── General ───────────────────────────────────────────────────
map("n", "<C-d>", "<C-d>zz", { desc = " Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = " Scroll up" })
map("v", ">", ">gv", { desc = "indent" })

-- ── conform ───────────────────────────────────────────────────
if settings.formatter == "conform" then
	map("n", "<leader>cf", function()
		require("conform").format()
	end, { desc = "Format" })
end

-- ── Copilot ───────────────────────────────────────────────────
if settings.ai.copilot then
	map("n", "<leader>tp", function()
		require("copilot")
	end, { desc = icons.git.Octoface .. "Enable Copilot" })
end

-- ── Buffer ────────────────────────────────────────────────────
map("n", "<leader>nb", "<cmd> new <CR>", { desc = icons.ui.NewFile .. " New buffer" })
map("n", "<leader>bd", "<cmd> q <CR>", { desc = icons.ui.Close .. " Close buffer" })

map("n", "<leader>bk", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = icons.ui.Close .. " Close buffer" })

map("n", "<leader>bo", function()
	require("nvchad.tabufline").closeOtherBufs()
end, { desc = icons.ui.BoldClose .. " Close other buffers" })

map("n", "<leader>bh", function()
	require("nvchad.tabufline").move_buf(-1)
end, { desc = icons.ui.Move .. " Move buffer to left" })

map("n", "<leader>bl", function()
	require("nvchad.tabufline").move_buf(1)
end, { desc = icons.ui.Move .. " Move buffer to right" })

map("n", "<S-L>", function()
	require("nvchad.tabufline").next()
end, { desc = icons.ui.ChevronRight .. " Goto next buffer" })

map("n", "<S-H>", function()
	require("nvchad.tabufline").prev()
end, { desc = icons.ui.ChevronRight .. " Goto previous buffer" })

-- ── Code ──────────────────────────────────────────────────────
map("v", "< leader >ca", function()
	vim.lsp.buf.code_action()
end, { desc = icons.ui.Action .. " Code Action" })
map("n", "< leader >ca", function()
	vim.lsp.buf.code_action()
end, { desc = icons.ui.Action .. " Code Action" })

map("n", "<leader>cr", function()
	require("nvchad.renamer").open()
end, { desc = icons.ui.Pencil .. " LSP rename" })
map("n", "<leader>cd", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = icons.ui.DebugConsole .. " diagnostic" })

map("n", "<leader>cc", function()
	local ok, start = require("indent_blankline.utils").get_current_context(
		vim.g.indent_blankline_context_patterns,
		vim.g.indent_blankline_use_treesitter_scope
	)

	if ok then
		vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
		vim.cmd([[normal! _]])
	end
end, { desc = icons.kind.Namespace .. " Jump to current context" })

map("n", "<leader>cp", function()
	require("actions-preview").code_actions()
end, { desc = icons.ui.Action .. " Code Action Preview" })

-- ── Dashboard ─────────────────────────────────────────────────
map("n", "<leader>;", function()
	require("nvchad.dashboard").open()
end, { desc = "Open Dashboard" })

-- ── Golang ────────────────────────────────────────────────────
if settings.lang.go then
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
end

-- ── Lazy ──────────────────────────────────────────────────────
map("n", "<leader>pl", ":Lazy<CR>", { desc = "󰒲 Open Plugin Manager" })

-- ── lsp_lines ─────────────────────────────────────────────────
if settings.utilities.lsplines then
	map("n", "<leader>ti", "<CMD>lua require('lsp_lines').toggle()<CR>", { desc = "∥ Toggle LspLines" })
end

-- ── Glance ────────────────────────────────────────────────────
if settings.ui.glance then
	map("n", "<leader>pd", "<CMD>Glance definitions<CR>", { desc = "⊶ Preview definition" })
	map("n", "<leader>pr", ":Glance references<CR>", { desc = " Preview references" })
	map("n", "<leader>pi", ":Glance implementations<CR>", { desc = " Preview implementations" })
	map("n", "<leader>pD", ":Glance type_definitions<CR>", { desc = "⊶ Preview type_definitions" })
	map("n", "gR", ":Glance references<CR>", { desc = " Preview references" })
	map("n", "gM", ":Glance implementations<CR>", { desc = " Preview implementations" })
	map("n", "gY", ":Glance type_definitions<CR>", { desc = "⊶ Preview type_definitions" })
end

-- ── Hop ───────────────────────────────────────────────────────
if settings.motions.hop then
	map("v", "<leader>h/", "<Cmd>HopPattern <cr>", { desc = " Hop Pattern" })
	map("v", "<leader>hc", "<Cmd>HopChar1 <cr>", { desc = "󰾺 Hop Character" })
	map("v", "<leader>hs", "<Cmd>HopChar2 <cr>", { desc = " Hop 2 Characters" })
	map("v", "<M-f>", "<Cmd>HopChar1 <cr>", { desc = "󰾺 Hop Character" })

	map("n", "<leader>hw", "<Cmd>HopWord <cr>", { desc = "󱡮 Hop Word" })
	map("n", "<leader>h/", "<Cmd>HopPattern <cr>", { desc = "󱡮 Hop Pattern" })
	map("n", "<leader>hc", "<Cmd>HopChar1 <cr>", { desc = "󱡮 Hop Character" })
	map("n", "<leader>hs", "<Cmd>HopChar2 <cr>", { desc = "󱡮 Hop 2 Characters" })
	map("n", "<M-f>", "<Cmd>HopChar1CurrentLine <cr>", { desc = "󱡮 Hop Character" })
end

-- ── hover ─────────────────────────────────────────────────────
if settings.ui.hover then
	map("n", "K", function()
		require("pretty_hover").hover()
	end, { desc = "󱤇 hover" })
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

map("n", "gr", function()
	if settings.ui.trouble then
		require("trouble").toggle("lsp_references")
	else
		vim.lsp.buf.references()
	end
end, { desc = "LSP references" })

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
	end, { desc = "󰛢 Harpoon toggle menu" })
	map("n", "<leader>ha", function()
		local harpoon = require("harpoon")
		harpoon:list():append()
	end, { desc = "󰛢 Harpoon Add File" })
	map("n", "<leader>mh", function()
		local harpoon = require("harpoon")
		harpoon:list():append()
	end, { desc = "󰛢 Harpoon Add File" })
	map("n", "<leader>sh", "<cmd>Telescope harpoon marks<cr>", { desc = "󰛢 Telescope Harpoon Marks" })
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
map("n", "<leader>om", ":Mason<CR>", { desc = "󰟾 Open Mason" })

-- ── multiplexer ───────────────────────────────────────────────
map("n", "<C-h>", function()
	require("smart-splits").move_cursor_left()
end, { desc = "󱂪 move cursor left" })
map("n", "<C-j>", function()
	require("smart-splits").move_cursor_down()
end, { desc = "󱂩 move cursor down" })
map("n", "<C-k>", function()
	require("smart-splits").move_cursor_up()
end, { desc = "󱔓 move cursor up" })
map("n", "<C-l>", function()
	require("smart-splits").move_cursor_right()
end, { desc = "󱂫 move cursor right" })

map("n", "<A-left>", function()
	require("smart-splits").resize_left()
end, { desc = "󰩨 resize left" })
map("n", "<A-down>", function()
	require("smart-splits").resize_down()
end, { desc = "󰩨 resize down" })
map("n", "<A-up>", function()
	require("smart-splits").resize_up()
end, { desc = "󰩨 resize up" })
map("n", "<A-right>", function()
	require("smart-splits").resize_right()
end, { desc = "󰩨 resize right" })

map("n", "<A-h>", function()
	require("smart-splits").resize_left()
end, { desc = "󰩨 resize left" })
map("n", "<A-j>", function()
	require("smart-splits").resize_down()
end, { desc = "󰩨 resize down" })
map("n", "<A-k>", function()
	require("smart-splits").resize_up()
end, { desc = "󰩨 resize up" })
map("n", "<A-l>", function()
	require("smart-splits").resize_right()
end, { desc = "󰩨 resize right" })

map("n", "<leader><leader>h", function()
	require("smart-splits").swap_buf_left()
end, { desc = "󰯍 swap buffer left" })
map("n", "<leader><leader>j", function()
	require("smart-splits").swap_buf_down()
end, { desc = "󰯎 Swap buffer down" })
map("n", "<leader><leader>k", function()
	require("smart-splits").swap_buf_up()
end, { desc = "󰯎 Swap buffer up" })
map("n", "<leader><leader>l", function()
	require("smart-splits").swap_buf_right()
end, { desc = "󰯍 Swap buffer right" })

-- ── nerdy ─────────────────────────────────────────────────────
if settings.utilities.nerdy then
	map("n", "<leader>sn", "<cmd>Nerdy<CR>", { desc = "󰓠 Nerd Fonts" })
end

-- ── notify ────────────────────────────────────────────────────
map("n", "<leader>nd", "<cmd> NoiceDismiss <CR>", { desc = " Dismiss Notifications" })

-- ── NvimTree ──────────────────────────────────────────────────
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "󱏒 Toggle nvimtree" })

-- TODO: nvterm

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
	map("n", "<leader>to", ':lua require("oil").toggle_float()<CR>', { desc = "󱏒 Open oil" })
	map("n", "<leader>oi", ":Oil<CR>", { desc = "󱏒 Open oil" })
	map("n", "<C-o>", ':lua require("oil").toggle_float()<CR>', { desc = "󱏒 Open oil" })
end

-- Rest
if settings.utilities.rest then
	map("n", "<leader>ht", function()
		require("rest-nvim").run()
	end, { desc = "󱅥 Run HTTP Request" })
	map("n", "<leader>hl", function()
		require("rest-nvim").last()
	end, { desc = "󱅣 reRun Last HTTP Request" })
end

-- ── Telescope ─────────────────────────────────────────────────
map(
	"n",
	"<leader>f",
	"<cmd> Telescope find_files follow=true no_ignore=true hidden=true theme=dropdown previewer=false <CR>",
	{ desc = icons.ui.Telescope .. " Find File" }
)
map(
	"n",
	"<leader>sf",
	"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
	{ desc = icons.ui.File .. " Find File" }
)
map("n", "<leader>sc", ":Telescope builtin<CR>", { desc = icons.ui.Terminal .. " Editor Commands" })
map("n", "<leader>so", "<cmd> Telescope oldfiles<CR>", { desc = icons.ui.History .. " Old Files" })
map("n", "<leader>/", "<cmd> Telescope live_grep <CR>", { desc = icons.ui.Search .. " Grep" })
map(
	"n",
	"<leader>sF",
	"<cmd> Telescope current_buffer_fuzzy_find <CR>",
	{ desc = icons.ui.Text .. " Find in current buffer" }
)
map("n", "<leader>sm", "<cmd> Telescope marks <CR>", { desc = icons.ui.BookMark .. " bookmarks" })
map("n", "<leader>sz", "<CMD>Telescope zoxide list<CR>", { desc = icons.ui.FolderSymlink .. " Zoxide" })
map("n", "<leader>zx", "<CMD>Telescope zoxide list<CR>", { desc = icons.ui.FolderSymlink .. " Zoxide" })
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = icons.kind.Class .. " Symbols" })
map("n", "<leader>sb", "<cmd> Telescope buffers <CR>", { desc = icons.ui.Files .. " Buffers" })
map("n", "<leader>sl", "<cmd>Telescope resume<cr>", { desc = icons.ui.Search .. " Resume last search" })

-- ── Todo ──────────────────────────────────────────────────────
map("n", "<leader>sd", "<cmd>TodoTelescope<cr>", { desc = "Telescope TODOs" })

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
end, { desc = icons.kind.Namespace .. " Toggle Conceal" })
map("n", "<leader>tnl", "<cmd> set nu! <CR>", { desc = "Toggle line number" })
map("n", "<leader>tnr", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })
map("n", "<leader>tD", function()
	require("gitsigns").toggle_deleted()
end, { desc = " Toggle deleted" })
map("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "󰸌 Nvchad themes" })
map("n", "<leader>ts", function()
	require("base46").toggle_transparency()
end, { desc = "󰂵 Toggle transparency" })
map("n", "<leader>tt", function()
	require("base46").toggle_theme()
end, { desc = icons.kind.Boolean .. " Toggle theme" })

-- ── Trouble ───────────────────────────────────────────────────
if settings.ui.trouble then
	map("n", "<leader>tr", ":TroubleToggle<CR>", { desc = icons.ui.SplitVertical .. " Toggle Trouble" })
	map(
		"n",
		"<leader>wd",
		":TroubleToggle workspace_diagnostics<CR>",
		{ desc = icons.ui.SplitVertical .. " Workspace Diagnostics" }
	)
	map("n", "<leader>cq", "<CMD>TroubleToggle quickfix<CR>", { desc = icons.ui.LightbulbAutofix .. " Quickfix" })
	map("n", "<leader>td", "<CMD>TodoTrouble<CR>", { desc = icons.ui.CheckList .. " Todo" })
	map("n", "gd", "<CMD>Trouble lsp_definitions<CR>", { desc = "Definition" })
	map("n", "gr", "<CMD>Trouble lsp_references<CR>", { desc = "References" })
	map("n", "gi", "<CMD>Trouble lsp_implementations<CR>", { desc = "Implementations" })
	map("n", "gD", "<CMD>Trouble lsp_type_definitions<CR>", { desc = "Type definition" })
end

-- ── Window ────────────────────────────────────────────────────

map("n", "<leader>|", "<CMD>vs <CR>", { desc = "󰤼 Vertical split" })
map("n", "<leader>-", "<CMD>sp <CR>", { desc = "󰤻 Horizontal split" })

-- ── unmap ─────────────────────────────────────────────────────
local nomap = vim.keymap.del
nomap("t", "<A-h>")
nomap("t", "<A-v>")

nomap("n", "<leader>sm")

nomap("n", "<leader>lf")
nomap("n", "<leader>q")
nomap("n", "<A-h>")
nomap("n", "<A-v>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>sh")
nomap("n", "<leader>sz")
nomap("n", "K")
nomap("n", "<leader>b")
nomap("n", "<C-n>")
nomap("n", "<leader>/")
nomap("n", "<leader>cm")
nomap("n", "<leader>n")
nomap("n", "<leader>pt")
nomap("n", "<leader>ls")
nomap("n", "<leader>ra")
nomap("n", "<leader>so")
nomap("n", "<leader>rn")

nomap("n", "<leader>fa")
nomap("n", "<leader>fb")
nomap("n", "<leader>ff")
nomap("n", "<leader>fh")
nomap("n", "<leader>fm")
nomap("n", "<leader>fo")
nomap("n", "<leader>fw")
nomap("n", "<leader>fz")
nomap("n", ";")
