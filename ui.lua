local utils = require "custom.utils"
local group_margin = "  "
local themes = require "custom.themes"

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

return {
  theme = "nero",
  -- theme = "tokyodark",
  theme_toggle = { "nero", "tokyodark" },

  extended_integrations = { "trouble", "hop", "todo", "notify" },
  changed_themes = themes,

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    style = "atom_colored", -- flatt_dark | flat_light | default | atom | atom_colored
    selected_item_bg = "colored",
  },

  transparency = false,

  tabufline = {
    overriden_modules = function(modules)
      table.remove(modules, 1) -- disable buffers shift when you toggle the tree
    end,
  },

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",

    overriden_modules = function(modules)
      table.insert(
        modules,
        8,
        (function()
          local hl = "%#StBg#"
          return hl .. " "
        end)()
      )

      table.insert(
        modules,
        8,
        (function()
          local hl = "%#StCodeium#"
          local icon = "" -- 󱜙  󰘦

          if utils.cmp_source "codeium" then
            icon = hl .. "󱜙" .. group_margin
          end

          return icon
        end)()
      )

      table.insert(
        modules,
        4,
        (function()
          return "%#RecordHl#" .. utils.Get_record()
        end)()
      )
    end,
  },

  nvdash = {
    load_on_startup = true,

    buttons = {
      {
        "󰁯  Restore Session",
        "Spc q l",
        function()
          require("persistence").load { last = true }
        end,
      },
      {
        "  Zoxide",
        "Spc z x",
        ":lua require('telescope').extensions.zoxide.list()",
      },
      {
        "  Find File",
        "Spc f",
        "Telescope find_files",
      },
      {
        "󰈚  Recent Files",
        "Spc s o",
        "Telescope oldfiles",
      },
      {
        "  Bookmarks",
        "Spc s m",
        "Telescope marks",
      },
      {
        "  Themes",
        "Spc t h",
        "Telescope themes",
      },
      {
        "  Config",
        "Spc o c",
        "next ~/.config/nvim/lua/custom/*.lua",
      },
      {
        "  Mappings",
        "Spc c h",
        "NvCheatsheet",
      },
    },
  },

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}
