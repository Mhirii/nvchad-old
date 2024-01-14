local config = function()
  local noice = require "noice"
  local spinners = require "noice.util.spinners"
  spinners.spinners["mine"] = {
    frames = {
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
    },
    interval = 80,
  }
  noice.setup {
    format = {
      spinner = {
        name = "mine",
        hl = "Constant",
      },
    },
    lsp = {
      progress = {
        enabled = false,
        format = {
          { "{data.progress.percentage} ", hl_group = "Comment" },
          { "{spinner} ",                  hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ",      hl_group = "Comment" },
        },
        format_done = {},
      },
      hover = { enabled = false },
      signature = { enabled = false, auto_open = { enabled = false } },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = false,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    cmdline = {
      format = {
        filter = { pattern = "^:%s*!", icon = " ", ft = "sh" },
        IncRename = {
          pattern = "^:%s*IncRename%s+",
          icon = " ",
          conceal = true,
          opts = {
            -- relative = "cursor",
            -- size = { min_width = 20 },
            -- position = { row = -3, col = 0 },
            buf_options = { filetype = "text" },
          },
        },
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 1, 2 },
        },
        win_options = {
          winblend = 5,
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "NoiceCmdlinePopupBorder",
            IncSearch = "",
            Search = "",
          },
          cursorline = false,
        },
      },
    },
    popupmenu = {
      enabled = true,
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = false,             -- enables the Noice messages UI
      view = "notify",             -- default view for messages
      view_error = "notify",       -- view for errors
      view_warn = "notify",        -- view for warnings
      view_history = "messages",   -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = false,
      view = "notify",
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
        view = "mini",
      },
      {
        view = "cmdline_output",
        filter = { cmdline = "^:", min_height = 5 },
        -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
      },
      {
        filter = { event = "msg_show", kind = "search_count" },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "; before #",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "; after #",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = " lines, ",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "go up one level",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "yanked",
        },
        opts = { skip = true },
      },
      {
        filter = { find = "No active Snippet" },
        opts = { skip = true },
      },
      {
        filter = { find = "waiting for cargo metadata" },
        opts = { skip = true },
      },
    },

    presets = {
      -- you can enable a preset by setting it to true, or a table that will override the preset config
      -- you can also add custom presets that you can enable/disable with enabled=true
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true,            -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
  }
end

return config
