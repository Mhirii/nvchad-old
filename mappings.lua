---@diagnostic disable: inject-field
local M = {}

local settings = require "custom.settings"

M.general = {
  n = {
    --  format with conform
    ["<C-d>"] = { "<C-d>zz", " Scroll down", opts = { silent = true } },
    ["<C-u>"] = { "<C-u>zz", " Scroll up", opts = { silent = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

local toggled = false
M.buffer = {
  n = {
    ["<leader>bf"] = {
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
      "Toggle Conceal",
    },
    ["<leader>bn"] = { "<cmd> new <CR>", "󰻭 New buffer" },
    -- quit buffer
    ["<leader>bd"] = {
      "<cmd> q<CR>",
      "󱪠 Close buffer", -- Terminals are hidden
    },
    -- close buffer + hide terminal buffer
    ["<leader>bk"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "󱪠 Close buffer", -- Terminals are hidden
    },
    ["<leader>bo"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs()
      end,
      "󰱞 Close other buffers",
    },
    ["<leader>bh"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "󱨻 Move buffer to left",
    },
    ["<leader>bl"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "󱨽 Move buffer to right",
    },
    ["<S-L>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "󰁔 Goto next buffer",
    },
    ["<S-H>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "󰁍 Goto prev buffer",
    },
  },
}

M.code = {
  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "󱃸 Code Action",
    },
  },
  n = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "󱃸 Code Action",
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
      "󰑕 LSP rename",
    },
    ["<leader>cd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "󰨰 Floating diagnostic",
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
        require("hover").hover()
      end,
      "󱤇 hover",
    },
    ["gK"] = {
      function()
        require("hover").hover_select()
      end,
      "󱁵 hover (select)",
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
  n = {
    ["<leader>hh"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "󱂩 New horizontal term",
    },
    ["<leader>vv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "󱂫 New vertical term",
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
      "Find all",
    },
    ["<leader>sf"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
      "Find all",
    },
    ["<leader>sc"] = { ":Telescope builtin<CR>", " Find Editor Command" },
    ["<leader>sr"] = { "<cmd> Telescope oldfiles<CR>", " Recent Files" },
    ["<leader>/"] = { "<cmd> Telescope live_grep <CR>", " Live grep" },
    ["<leader>sF"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", " Find in current buffer" },
    ["<leader>sm"] = { "<cmd> Telescope marks <CR>", "󰸖 telescope bookmarks" },
    ["<leader>sz"] = { "<CMD>Telescope zoxide list<CR>", "󰥩 Zoxide" },
    ["<leader>zx"] = { "<CMD>Telescope zoxide list<CR>", "󰥩 Zoxide" },
    ["<leader>ss"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      "󰊕 Search Symbols",
    },
    ["<leader>so"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>sb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>sl"] = { "<cmd>Telescope resume<cr>", "Resume last search" },
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

M.toggle = {
  n = {
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
    ["<leader>tb"] = { ":TroubleToggle<CR>", "󱂩 Toggle Trouble" },
    ["<leader>wd"] = { ":TroubleToggle workspace_diagnostics<CR>", "󱂩 Workspace Diagnostics" },
    ["<leader>cq"] = { "<CMD>TroubleToggle quickfix<CR>", "󰁨 Quickfix" },
    ["<leader>td"] = { "<CMD>TodoTrouble<CR>", " Todo" },
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
}

for _, plugin in ipairs(plugins) do
  if plugin.setting then
    require("core.utils").load_mappings(plugin.name)
  end
end

return M
-- TODO: bring keys from custom.configs
-- TODO: use cod icons
