---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

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

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.treesitter = {
  n = {
    ["<leader>nts"] = { "<cmd> Inspect<CR>", "HL groups Under Cursor" },
    ["<leader>ntt"] = { "<cmd> InspectTree<CR>", "Parsed Syntax Tree" },
    ["<leader>ntq"] = { "<cmd> PreviewQuery<CR>", "Query Editor" },
  },
}

M.resize = {
  n = {
    ["C-M-j"] = { ":resize -2<CR>", "Resize Window -2" },
    ["C-M-k"] = { ":resize +2<CR>", "Resize Window +2" },
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
    ["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },

    -- quit buffer
    ["<leader>bd"] = {
      "<cmd> q<CR>",
      "Close buffer", -- Terminals are hidden
    },

    -- close buffer + hide terminal buffer
    ["<leader>bk"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer", -- Terminals are hidden
    },
  },
}

M.terms = {
  n = {
    ["<leader>ft"] = {
      "<cmd> Telescope terms <CR>",
      "Pick hidden term",
    },
    ["<leader>fs"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      "Search Symbols",
    },
  },
}

M.nvterm = {
  n = {
    ["<leader>hh"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>vv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

M.config = {
  n = {
    ["<leader>oc"] = { ":next ~/.config/nvim/lua/custom/*.lua<CR>", "Open Editor Configuration" },
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
  },
}

M.marks = {
  n = {
    ["<leader>hr"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "Harpoon toggle menu",
    },
    ["<leader>mh"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      "Harpoon Add File",
    },

    ["<leader>mb"] = {
      function()
        require("bookmarks").add_bookmarks()
      end,
      "Add Bookmark",
    },
    ["<leader>mt"] = {
      function()
        require("bookmarks").toggle_bookmarks()
      end,
      "Toggle Bookmarks",
    },
  },
}

M.update = {
  n = {
    ["<leader>uu"] = { ":NvChadUpdate<CR>", "Update NvChad UI" },
  },
}

M.lazy = {
  n = {
    ["<leader>ll"] = { ":Lazy<CR>", "Open Plugin Manager" },
  },
}

M.mason = {
  n = {
    ["<leader>om"] = { ":Mason<CR>", "Open LSP Installer" },
  },
}

M.code = {
  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP Code Action",
    },
  },

  n = {

    ["<leader>cq"] = {
      "<CMD>TroubleToggle quickfix<CR>",
      "Quickfix",
    },

    ["<leader>sr"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP Signature Help",
    },

    ["<leader>cr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>cd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  },
}

M.dashboard = {
  n = {
    ["<leader>;"] = { "<cmd> Nvdash<CR>", "Open Dashboard" },
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
  },
}

M.extra = {
  n = {

    ["<leader>zh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>zf"] = { "<cmd>TodoTelescope keywords=FIX,FIXME<CR>", "Find Todo" },
    ["<leader>zp"] = { "<cmd>PP<CR>", "Send buffer to Pastebin Client" },
  },
  v = {
    ["<leader>zp"] = { "<cmd>PP<CR>", "Send selected Code to Pastebin Client" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-L>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-H>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

M.window = {
  n = {
    ["<leader>|"] = { "<CMD>vs <CR>", "󰤼 Vertical split", opts = { nowait = true } },
    ["<leader>-"] = { "<CMD>sp <CR>", "󰤻 Horizontal split", opts = { nowait = true } },
  },
}

M.disabled = {

  n = {
    -- general
    ["<leader>fm"] = "",

    -- diagnostics
    ["<leader>lf"] = "",
    -- loclist
    ["<leader>q"] = "",

    -- Terminal
    ["<leader>v"] = "",
    ["<leader>h"] = "",

    -- Telescope
    ["<leader>fh"] = "",
    ["<leader>fz"] = "",

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
  },
}

return M
