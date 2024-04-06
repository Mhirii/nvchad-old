require "nvchad.mappings"
local settings = require "settings"
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

map("i", "jk", "<ESC>")

map({ "n" }, "<leader>qq", "<CMD>ccl<CR>", { desc = "Quickfix - Close all" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

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
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Diagnostic - Open float" })

map("n", "<leader>cp", function()
  require("actions-preview").code_actions()
end, { desc = "Code Action Preview" })

-- ── Dashboard ─────────────────────────────────────────────────
map("n", "<leader>;", function()
  require("nvchad.dashboard").open()
end, { desc = "Dashboard" })

-- ── Lazy ──────────────────────────────────────────────────────
map("n", "<leader>pl", ":Lazy<CR>", { desc = "Lazy - Open Plugin Manager" })

-- ── mason ─────────────────────────────────────────────────────
map("n", "<leader>om", ":Mason<CR>", { desc = "Mason" })

-- ── NvimTree ──────────────────────────────────────────────────
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "NvimTree - Toggle" })

-- ── Term ──────────────────────────────────────────────────────
map({ "n", "t" }, "<A-2>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "floatTerm", size = 0.3 }
end)
map({ "n", "t" }, "<A-1>", function()
  require("nvchad.term").toggle { pos = "sp", id = "floatTerm", size = 0.3 }
end)
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end)

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

-- ── Toggle ────────────────────────────────────────────────────
local toggled = false
map("n", "<leader>Ta", function()
  vim.opt.concealcursor = "nc"
  if toggled then
    vim.opt.conceallevel = 0
    toggled = false
  else
    vim.opt.conceallevel = 2
    toggled = true
  end
end, { desc = "Toggle Conceal" })
map("n", "<leader>Tnl", "<cmd> set nu! <CR>", { desc = "Toggle - Line Number" })
map("n", "<leader>Tnr", "<cmd> set rnu! <CR>", { desc = "Toggle - Relative Number" })
map("n", "<leader>TD", function()
  require("gitsigns").toggle_deleted()
end, { desc = "GitSigns - Toggle deleted" })
map("n", "<leader>Th", "<cmd> Telescope themes <CR>", { desc = "Nvchad - Themes" })
map("n", "<leader>Ts", function()
  require("base46").toggle_transparency()
end, { desc = "Nvchad - Toggle Transparency" })

-- ── Window ────────────────────────────────────────────────────

map("n", "<leader>|", "<CMD>vs <CR>", { desc = "Split - Vertical" })
map("n", "<leader>-", "<CMD>sp <CR>", { desc = "Split - Horizontal" })

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

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal - Close term in terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey - all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey - query lookup" })

nomap("n", "<leader>cc")
nomap("t", "<ESC>")
nomap("n", "gr")
