---@dijgnostic disable: inject-field
local M = {}

local icons = require "custom.icons"
local settings = require "custom.settings"

M.general = {
  n = {
    ["<C-d>"] = { "<C-d>zz", " Scroll down", opts = { silent = true } },
    ["<C-u>"] = { "<C-u>zz", " Scroll up", opts = { silent = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.conform = {
  n = {
    ["<leader>cf"] = {
      function()
        require("conform").format()
      end,
      icons.ui.List .. " Format",
    },
  },
}

M.buffer = {
  n = {
    ["<leader>nb"] = { "<cmd> new <CR>", icons.ui.NewFile .. " New buffer" },
    -- quit buffer
    ["<leader>bd"] = {
      "<cmd> q<CR>",
      icons.ui.Close .. " Close buffer", -- Terminals are hidden
    },
    -- close buffer + hide terminal buffer
    ["<leader>bk"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      icons.ui.Close .. " Close buffer", -- Terminals are hidden
    },
    ["<leader>bo"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs()
      end,
      icons.ui.BoldClose .. " Close other buffers",
    },
    ["<leader>bh"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      icons.ui.Move .. " Move buffer to left",
    },
    ["<leader>bl"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      icons.ui.Move .. " Move buffer to right",
    },
    ["<S-L>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      icons.ui.ChevronRight .. " Goto next buffer",
    },
    ["<S-H>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      icons.ui.ChevronRight .. " Goto prev buffer",
    },
  },
}

M.code = {
  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      icons.ui.Action .. " Code Action",
    },
  },
  n = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      icons.ui.Action .. " Code Action",
    },
    -- ["<leader>sr"] = {
    --   function()
    --     vim.lsp.buf.signature_help()
    --   end,
    --   "󰘥 LSP Signature Help",
    -- },
    ["<leader>cr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      icons.ui.Pencil .. " LSP rename",
    },
    ["<leader>cd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      icons.ui.DebugConsole .. " diagnostic",
    },
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      icons.kind.Namespace .. " Jump to current context",
    },
  },
}

M.code_actions_preview = {
  n = {
    ["<leader>cp"] = {
      function()
        require("actions-preview").code_actions()
      end,
      "󱃸 Code Action Preview",
    },
  },
}

M.config = {
  n = {
    ["<leader>oc"] = { ":next ~/.config/nvim/lua/custom/*.lua<CR>", " Open Editor Configuration" },
  },
}

M.dashboard = {
  n = {
    ["<leader>;"] = { "<cmd> Nvdash<CR>", "󰋜 Open Dashboard" },
  },
}

M.extra = {
  n = {
    ["<leader>zh"] = { "<cmd> Telescope help_tags <CR>", "󰋖 Help page" },
  },
}

M.golang = {
  plugin = true,
  n = {
    ["<leader>cr"] = { "<CMD>GoRename<CR>", "󰟓 Rename" },
    ["<leader>cl"] = { "<CMD>GoCodeLenAct<CR>", "󰟓 Code Lens This Line" },
    ["<leader>ln"] = { "<CMD>GoLint<CR>", "󰟓 Lint" },

    ["<leader>ab"] = { "<CMD>GoBuild<CR>", icons.ui.Gear .. " Build" },
    ["<leader>ar"] = { "<CMD>GoRun<CR>", icons.ui.Triangle .. " Run" },

    ["<leader>atb"] = { "<CMD>GoTestFile<CR>", icons.ui.File .. " Test this File" },
    ["<leader>atp"] = { "<CMD>GoTestPkg<CR>", icons.kind.Package .. " Test this Package" },
    ["<leader>atf"] = { "<CMD>GoTestFunc<CR>", icons.kind.Function .. " Test this Function" },
    ["<leader>ata"] = { "<CMD>GoAddTest<CR>", icons.ui.Action .. " Add Test for this Function" },
    ["<leader>ate"] = { "<CMD>GoAddAllTest<CR>", icons.ui.Action .. " Add Tests for all Functions" },
    ["<leader>ac"] = { "<CMD>GoCheat<CR>", icons.ui.Book .. " Cheatsheet" },
    ["<leader>ao"] = { "<CMD>GoCheat<CR>", icons.ui.Book .. " Cheatsheet" },
    ["<leader>al"] = { "<CMD>GoLint<CR>", icons.ui.Watches .. " Lint" },
    ["<leader>as"] = { "<CMD>GoCodeLenAct<CR>", icons.ui.Fire .. " Code Lens This Line" }, --TODO: Change Icon
    ["<leader>ah"] = { "<CMD>GoToggleInlay<CR>", icons.diagnostics.Hint .. " Inlay Hints" },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
  },
}

M.lazy = {
  n = {
    ["<leader>ll"] = { ":Lazy<CR>", "󰒲 Open Plugin Manager" },
    ["<leader>pl"] = { ":Lazy<CR>", "󰒲 Open Plugin Manager" },
  },
}

M.lsp_lines = {
  plugin = true,
  n = {
    ["<leader>ti"] = {
      ":lua require('lsp_lines').toggle() <CR>",
      "∥ Toggle LspLines",
    },
  },
}

M.glance = {
  plugin = true,
  n = {
    ["<leader>pd"] = {
      ":Glance definitions<CR>",
      "⊶ Preview definition",
    },
    ["<leader>pr"] = {
      ":Glance references<CR>",
      " Preview references",
    },
    ["<leader>pi"] = {
      ":Glance implementations<CR>",
      " Preview implementations",
    },
    ["<leader>pD"] = {
      ":Glance type_definitions<CR>",
      "⊶ Preview type_definitions",
    },
    ["gR"] = {
      ":Glance references<CR>",
      " Preview references",
    },
    ["gM"] = {
      ":Glance implementations<CR>",
      " Preview implementations",
    },
    ["gY"] = {
      ":Glance type_definitions<CR>",
      "⊶ Preview type_definitions",
    },
  },
}

M.hop = {
  plugin = true,
  v = {
    ["<leader>hw"] = { "<Cmd>HopWord <cr>", "󰟵 Hop Word" },
    ["<leader>h/"] = { "<Cmd>HopPattern <cr>", " Hop Pattern" },
    ["<leader>he"] = { "<Cmd>HopAnywhere <cr>", " Hop Anywhere" },
    ["<leader>hc"] = { "<Cmd>HopChar1 <cr>", "󰾺 Hop Character" },
    ["<leader>hv"] = { "<Cmd>HopVertical <cr>", " Hop Vertical" },
    ["<leader>hs"] = { "<Cmd>HopChar2 <cr>", " Hop 2 Characters" },
    ["<M-s>"] = { "<Cmd>HopWord <cr>", "󰟵 Hop Word" },
    ["<M-f>"] = { "<Cmd>HopChar1 <cr>", "󰾺 Hop Character" },
  },
  n = {
    ["<leader>hw"] = { "<Cmd>HopWord <cr>", "󱡮 Hop Word" },
    ["<leader>h/"] = { "<Cmd>HopPattern <cr>", "󱡮 Hop Pattern" },
    ["<leader>he"] = { "<Cmd>HopAnywhere <cr>", "󱡮 Hop Anywhere" },
    ["<leader>hc"] = { "<Cmd>HopChar1 <cr>", "󱡮 Hop Character" },
    ["<leader>hv"] = { "<Cmd>HopVertical <cr>", "󱡮 Hop Vertical" },
    ["<leader>hs"] = { "<Cmd>HopChar2 <cr>", "󱡮 Hop 2 Characters" },
    ["<M-s>"] = { "<Cmd>HopWord <cr>", "󱡮 Hop Word" },
    ["<M-f>"] = { "<Cmd>HopChar1 <cr>", "󱡮 Hop Character" },
  },
}

-- Only Load the mapping when the setting is true
-- if settings.motions.hop then
--   require("core.utils").load_mappings "hop"
-- end

M.hover = {
  plugin = true,
  n = {
    ["K"] = {
      function()
        require("pretty_hover").hover()
      end,
      "󱤇 hover",
    },
  },
}

M.lspconfig = {
  plugin = true,
  n = {

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    -- ["K"] = {
    --   function()
    --     vim.lsp.buf.hover()
    --   end,
    --   "LSP hover",
    -- },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>hr"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "󰛢 Harpoon toggle menu",
    },
    ["<leader>mh"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      "󰛢 Harpoon Add File",
    },
    ["<leader>sh"] = { "<cmd>Telescope harpoon marks<cr>", "󰛢 Telescope Harpoon Marks" },
  },
}

M.bookmarks = {
  n = {
    ["<leader>mb"] = {
      function()
        require("bookmarks").add_bookmarks()
      end,
      "󰃄 Add Bookmark",
    },
    ["<leader>mt"] = {
      function()
        require("bookmarks").toggle_bookmarks()
      end,
      "󰧏 Toggle Bookmarks",
    },
  },
}

M.mason = {
  n = {
    ["<leader>om"] = { ":Mason<CR>", "󰟾 Open Mason" },
  },
}

M.multiplexer = {
  n = {
    ["<C-h>"] = {
      function()
        require("smart-splits").move_cursor_left()
      end,
      "󱂪 move cursor left",
    },
    ["<C-j>"] = {
      function()
        require("smart-splits").move_cursor_down()
      end,
      "󱂩 move cursor down",
    },
    ["<C-k>"] = {
      function()
        require("smart-splits").move_cursor_up()
      end,
      "󱔓 move cursor up",
    },
    ["<C-l>"] = {
      function()
        require("smart-splits").move_cursor_right()
      end,
      "󱂫 move cursor right",
    },
    ["<M-h>"] = {
      function()
        require("smart-splits").resize_left()
      end,
      "󰩨 resize left",
    },
    ["<M-j>"] = {
      function()
        require("smart-splits").resize_down()
      end,
      "󰩨 resize down",
    },
    ["<M-k>"] = {
      function()
        require("smart-splits").resize_up()
      end,
      "󰩨 resize up",
    },
    ["<M-l>"] = {
      function()
        require("smart-splits").resize_right()
      end,
      "󰩨 resize right",
    },
    ["<leader><leader>h"] = {
      function()
        require("smart-splits").swap_buf_left()
      end,
      "󰯍 swap buffer left",
    },
    ["<leader><leader>j"] = {
      function()
        require("smart-splits").swap_buf_down()
      end,
      "󰯎 Swap buffer down",
    },
    ["<leader><leader>k"] = {
      function()
        require("smart-splits").swap_buf_up()
      end,
      "󰯎 Swap buffer up",
    },
    ["<leader><leader>l"] = {
      function()
        require("smart-splits").swap_buf_right()
      end,
      "󰯍 Swap buffer right",
    },
  },
}

M.nerdy = {
  plugin = true,
  n = {
    ["<leader>sn"] = { "<cmd>Nerdy<CR>", "󰓠 Nerd Fonts" },
  },
}

M.notify = {
  n = {
    ["<leader>nd"] = { "<cmd> NoiceDismiss <CR>", " Dismiss Notifications" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "󱏒 Toggle nvimtree" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-1>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-2>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
    ["<A-3>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-1>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-2>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
    ["<A-3>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    -- new
    ["<leader>nh"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      icons.ui.SplitHorizontal .. " New horizontal term",
    },
    ["<leader>nv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      icons.ui.SplitVertical .. " New vertical term",
    },
  },
}

M.oil = {
  plugin = true,
  n = {
    ["<leader>to"] = { ':lua require("oil").toggle_float()<CR>', "󱏒 Open oil" },
    ["<leader>oi"] = { ":Oil<CR>", "󱏒 Open oil" },
    ["<C-o>"] = { ':lua require("oil").toggle_float()<CR>', "󱏒 Open oil" },
  },
}

-- if settings.ui.oil then
--   require("core.utils").load_mappings "oil"
-- end

M.refactor = {
  plugin = true,
  n = {
    ["<leader>re"] = { ":Refactor extract<CR>", "Extract" },
    ["<leader>rE"] = { ":Refactor extract_to_file<CR>", "Extract to file" },
    ["<leader>rv"] = { ":Refactor extract_var<CR>", "Extract Variable" },
    ["<leader>ri"] = { ":Refactor inline_var<CR>", "Extract inline variable" },
    ["<leader>rI"] = { ":Refactor inline_func<CR>", "Extract function" },
    ["<leader>rb"] = { ":Refactor extract_block<CR>", "Extract block" },
    ["<leader>rB"] = { ":Refactor extract_block_to_file<CR>", "Extract block to file" },
    ["<leader>rf"] = {
      function()
        require("telescope").extensions.refactoring.refactors()
      end,
      "Select Refactor",
    },
  },
  v = {
    ["<leader>re"] = { ":Refactor extract<CR>", "Extract" },
    ["<leader>rE"] = { ":Refactor extract_to_file<CR>", "Extract to file" },
    ["<leader>rv"] = { ":Refactor extract_var<CR>", "Extract Variable" },
    ["<leader>ri"] = { ":Refactor inline_var<CR>", "Extract inline variable" },
    ["<leader>rf"] = {
      function()
        require("telescope").extensions.refactoring.refactors()
      end,
      "Select Refactor",
    },
  },
}

M.rest = {
  plugin = true,
  n = {
    ["<leader>ht"] = {
      function()
        require("rest-nvim").run()
      end,
      "󱅥 Run HTTP Request",
    },
    ["<leader>hl"] = {
      function()
        require("rest-nvim").last()
      end,
      "󱅣 reRun Last HTTP Request",
    },
  },
}

M.telescope = {
  n = {

    ["<leader>f"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true theme=dropdown previewer=false <CR>",
      icons.ui.Telescope .. " Find File",
    },
    ["<leader>sf"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
      icons.ui.File .. " Find File",
    },
    ["<leader>sc"] = { ":Telescope builtin<CR>", icons.ui.Terminal .. " Editor Commands" },
    ["<leader>so"] = { "<cmd> Telescope oldfiles<CR>", icons.ui.History .. " Old Files" },
    ["<leader>/"] = { "<cmd> Telescope live_grep <CR>", icons.ui.Search .. " Grep" },
    ["<leader>sF"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", icons.ui.Text .. " Find in current buffer" },
    ["<leader>sm"] = { "<cmd> Telescope marks <CR>", icons.ui.BookMark .. " bookmarks" },
    ["<leader>sz"] = { "<CMD>Telescope zoxide list<CR>", icons.ui.FolderSymlink .. " Zoxide" },
    ["<leader>zx"] = { "<CMD>Telescope zoxide list<CR>", icons.ui.FolderSymlink .. " Zoxide" },
    ["<leader>ss"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      icons.kind.Class .. " Symbols",
    },
    ["<leader>sb"] = { "<cmd> Telescope buffers <CR>", icons.ui.Files .. " Buffers" },
    ["<leader>sl"] = { "<cmd>Telescope resume<cr>", icons.ui.Search .. " Resume last search" },
  },
}

M.todo = {
  n = {
    ["<leader>sd"] = { "<cmd>TodoTelescope<cr>", "Telescope TODOs" },
  },
}

M.terms = {
  n = {
    ["<leader>st"] = {
      "<cmd> Telescope terms <CR>",
      "Pick hidden term",
    },
    ["<M-1>"] = {
      "<cmd> ToggleTerm direction=horizontal <CR>",
      "Toggle Horizontal Term",
    },
    ["<M-2>"] = {
      "<cmd> ToggleTerm direction=vertical <CR>",
      "Toggle Vertical Term",
    },
    ["<M-3>"] = {
      "<cmd> ToggleTerm direction=float <CR>",
      "Toggle Vertical Term",
    },
  },
  t = {
    ["<M-1>"] = {
      "<cmd> ToggleTerm direction=horizontal <CR>",
      "Toggle Horizontal Term",
    },
    ["<M-2>"] = {
      "<cmd> ToggleTerm direction=vertical <CR>",
      "Toggle Vertical Term",
    },
    ["<M-3>"] = {
      "<cmd> ToggleTerm direction=float <CR>",
      "Toggle Vertical Term",
    },
    ["<M-w>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

local toggled = false
M.toggle = {
  n = {
    ["<leader>ta"] = {
      function()
        vim.opt.concealcursor = "nc"
        if toggled then
          vim.opt.conceallevel = 0
          toggled = false
        else
          vim.opt.conceallevel = 2
          toggled = true
        end
      end,
      icons.kind.Namespace .. " Toggle Conceal",
    },
    ["<leader>tnl"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>tnr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ["<leader>tD"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      " Toggle deleted",
    },
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "󰸌 Nvchad themes" },
    ["<leader>ts"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "󰂵 Toggle transparency",
    },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_theme()
      end,
      icons.kind.Boolean .. " Toggle theme",
    },
  },
}

-- M.treesitter = {
--   n = {
--     ["<leader>nts"] = { "<cmd> Inspect<CR>", "HL groups Under Cursor" },
--     ["<leader>ntt"] = { "<cmd> InspectTree<CR>", "Parsed Syntax Tree" },
--     ["<leader>ntq"] = { "<cmd> PreviewQuery<CR>", "Query Editor" },
--   },
-- }

M.trouble = {
  plugin = true,
  n = {
    ["<leader>tr"] = { ":TroubleToggle<CR>", icons.ui.SplitVertical .. " Toggle Trouble" },
    ["<leader>wd"] = { ":TroubleToggle workspace_diagnostics<CR>", icons.ui.SplitVertical .. " Workspace Diagnostics" },
    ["<leader>cq"] = { "<CMD>TroubleToggle quickfix<CR>", icons.ui.LightbulbAutofix .. " Quickfix" },
    ["<leader>td"] = { "<CMD>TodoTrouble<CR>", icons.ui.CheckList .. " Todo" },
    ["gd"] = { "<CMD>Trouble lsp_definitions<CR>", "Definition" },
    ["gr"] = { "<CMD>Trouble lsp_references<CR>", "References" },
    ["gi"] = { "<CMD>Trouble lsp_implementations<CR>", "Implementations" },
    ["gD"] = { "<CMD>Trouble lsp_type_definitions<CR>", "Type definition" },
  },
}

M.update = {
  n = {
    ["<leader>uu"] = { ":NvChadUpdate<CR>", "Update NvChad UI" },
  },
}

M.window = {
  n = {
    ["<leader>|"] = { "<CMD>vs <CR>", "󰤼 Vertical split", opts = { nowait = true } },
    ["<leader>-"] = { "<CMD>sp <CR>", "󰤻 Horizontal split", opts = { nowait = true } },
  },
}

M.disabled = {
  t = {
    -- Terminal
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  },
  n = {
    -- general
    ["<leader>sm"] = "",
    -- diagnostics
    ["<leader>lf"] = "",
    -- loclist
    ["<leader>q"] = "",
    -- Terminal
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    -- Telescope
    ["<leader>sh"] = "",
    ["<leader>sz"] = "",
    -- lspconfig
    ["<leader>ca"] = "",
    ["K"] = "",
    -- Buffer
    ["<leader>b"] = "",
    -- ["<C-s>"] = "",
    -- NvimTree
    ["<C-n>"] = "",
    -- Comment
    ["<leader>/"] = "",
    -- Git
    ["<leader>cm"] = "", -- Commits
    ["<leader>ph"] = "", -- Preview hunk
    -- Editor
    ["<leader>n"] = "", -- linenr
    -- Terminal
    ["<leader>pt"] = "",
    -- LSP
    ["<leader>ls"] = "",
    -- NvChad
    ["<leader>ra"] = "",
    ["<leader>so"] = "", -- moved: <leader>fr
    ["<leader>rh"] = "",
    ["<leader>rn"] = "",

    -- find all
    ["<leader>fa"] = "",
    -- find buffer
    ["<leader>fb"] = "",
    -- find file
    ["<leader>ff"] = "",
    -- find help
    ["<leader>fh"] = "",
    -- format
    ["<leader>fm"] = "",
    -- find old
    ["<leader>fo"] = "",
    -- find word
    ["<leader>fw"] = "",
    -- find current buffer
    ["<leader>fz"] = "",
  },
}

local plugins = {
  { name = "oil", setting = settings.ui.oil },
  { name = "trouble", setting = settings.ui.trouble },
  { name = "code_actions_preview", setting = settings.ui.code_actions },
  { name = "hover", setting = settings.ui.hover },
  { name = "glance", setting = settings.ui.glance },
  { name = "harpoon", setting = settings.motions.harpoon },
  { name = "bookmarks", setting = settings.motions.bookmarks },
  { name = "hop", setting = settings.motions.hop },
  { name = "lsp_lines", setting = settings.utilities.lsplines },
  { name = "rest", setting = settings.utilities.rest },
  { name = "nerdy", setting = settings.utilities.nerdy },
  { name = "terms", setting = settings.extras.terms },
  { name = "nvterm", setting = not settings.extras.terms },
  { name = "refactor", setting = settings.refactoring },
  -- This will be loaded from custom.configs.go only when the go plugin is loaded
  { name = "golang", setting = false },
}

for _, plugin in ipairs(plugins) do
  if plugin.setting then
    require("core.utils").load_mappings(plugin.name)
  end
end

return M
-- TODO: bring keys from custom.configs
-- TODO: use cod icons
