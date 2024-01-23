---@type MappingsTablemappingsmappings
local M = {}

local function code_action()
  local settings = require "custom.settings"
  if settings.ui.code_actions then
    require("actions-preview").code_actions()
  else
    vim.lsp.buf.code_action()
  end
end

M.general = {
  n = {
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<C-d>"] = { "<C-d>zz", " Scroll down", opts = { silent = true } },
    ["<C-u>"] = { "<C-u>zz", " Scroll up", opts = { silent = true } },
    ["<leader>tr"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "󰂵 Toggle transparency",
    },
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
    ["<leader>bn"] = { "<cmd> enew <CR>", "󰻭 New buffer" },
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
    ["<leader>cp"] = {
      code_action,
      "󱃸 Code Action Preview",
    },
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "󱃸 Code Action",
    },
  },
  n = {
    ["<leader>cp"] = {
      code_action,
      "󱃸 Code Action Preview",
    },
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "󱃸 Code Action",
    },
    ["<leader>cq"] = {
      "<CMD>TroubleToggle quickfix<CR>",
      "󰁨 Quickfix",
    },
    ["<leader>sr"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "󰘥 LSP Signature Help",
    },
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
    ["<leader>zh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
  },
}

M.lazy = {
  n = {
    ["<leader>ll"] = { ":Lazy<CR>", "󰒲 Open Plugin Manager" },
  },
}

M.lsp_lines = {
  n = {
    ["<leader>ti"] = {
      ":lua require('lsp_lines').toggle() <CR>",
      "∥ Toggle LspLines",
    },
  },
}

M.glance = {
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

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

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

M.marks = {
  n = {
    ["<leader>hr"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "󰷐 Harpoon toggle menu",
    },
    ["<leader>mh"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      "󰛢 Harpoon Add File",
    },
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
      " resize left",
    },
    ["<M-j>"] = {
      function()
        require("smart-splits").resize_down()
      end,
      " resize down",
    },
    ["<M-k>"] = {
      function()
        require("smart-splits").resize_up()
      end,
      " resize up",
    },
    ["<M-l>"] = {
      function()
        require("smart-splits").resize_right()
      end,
      " resize right",
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
  n = {
    ["<leader>to"] = { ':lua require("oil").toggle_float()<CR>', "Open oil" },
  },
}

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

M.telescope = {
  n = {
    ["<leader>fc"] = { ":Telescope builtin<CR>", "Find Editor Command" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles<CR>", "Recent Files" },
    ["<leader>/"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fl"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "telescope projects" },
    ["<leader>fh"] = { "<cmd>Telescope harpoon marks<cr>", "Telescope Harpoon Marks" },
    ["<leader>fz"] = { "<CMD>Telescope zoxide list<CR>", "Find in current buffer" },
    ["<leader>fs"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      "Search Symbols",
    },
  },
}

M.terms = {
  n = {
    ["<leader>ft"] = {
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
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      " Toggle deleted",
    },
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "󰸌 Nvchad themes" },
    ["<leader>tb"] = { ":TroubleToggle<CR>", "󱂩 Toggle Trouble" },
    -- ["<leader>to"] = { ':lua require("oil").setup()<CR>', "󱏒 Toggle oil" },
  },
}

M.treesitter = {
  n = {
    ["<leader>nts"] = { "<cmd> Inspect<CR>", "HL groups Under Cursor" },
    ["<leader>ntt"] = { "<cmd> InspectTree<CR>", "Parsed Syntax Tree" },
    ["<leader>ntq"] = { "<cmd> PreviewQuery<CR>", "Query Editor" },
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
    ["<leader>fm"] = "",
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
    ["<leader>fh"] = "",
    ["<leader>fz"] = "",
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
    ["<leader>fo"] = "", -- moved: <leader>fr
    ["<leader>rh"] = "",
    ["<leader>rn"] = "",
  },
}

return M
