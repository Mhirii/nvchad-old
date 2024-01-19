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

M.multiplexer = {
  n = {
    ["<C-h>"] = {
      function()
        require("smart-splits").move_cursor_left()
      end,
      "move cursor left",
    },
    ["<C-j>"] = {
      function()
        require("smart-splits").move_cursor_down()
      end,
      "move cursor down",
    },
    ["<C-k>"] = {
      function()
        require("smart-splits").move_cursor_up()
      end,
      "move cursor up",
    },
    ["<C-l>"] = {
      function()
        require("smart-splits").move_cursor_right()
      end,
      "move cursor right",
    },
    ["<M-h>"] = {
      function()
        require("smart-splits").resize_left()
      end,
      "move cursor left",
    },
    ["<M-j>"] = {
      function()
        require("smart-splits").resize_down()
      end,
      "move cursor down",
    },
    ["<M-k>"] = {
      function()
        require("smart-splits").resize_up()
      end,
      "move cursor up",
    },
    ["<M-l>"] = {
      function()
        require("smart-splits").resize_right()
      end,
      "move cursor right",
    },

    ["<leader><leader>h"] = {
      function()
        require("smart-splits").swap_buf_left()
      end,
      "move cursor left",
    },
    ["<leader><leader>j"] = {
      function()
        require("smart-splits").swap_buf_down()
      end,
      "move cursor left",
    },
    ["<leader><leader>k"] = {
      function()
        require("smart-splits").swap_buf_up()
      end,
      "move cursor left",
    },
    ["<leader><leader>l"] = {
      function()
        require("smart-splits").swap_buf_right()
      end,
      "move cursor left",
    },
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
    ["<leader>fs"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      "Search Symbols",
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

local function code_action()
  local settings = require "custom.settings"
  if settings.ui.code_actions then
    require("actions-preview").code_actions()
  else
    vim.lsp.buf.code_action()
  end
end

M.code = {
  v = {
    ["<leader>ca"] = {
      code_action,
      "Code Action",
    },
  },

  n = {

    ["<leader>ca"] = {
      code_action,
      "Code Action",
    },

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
