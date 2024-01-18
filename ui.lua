local status = require("custom.utils").status
local group_margin = "  "

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

return {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "tokyodark" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    style = "atom_colored", -- flatt_dark | flat_light | default | atom | atom_colored
    selected_item_bg = "colored",
  },

  transparency = false,

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",

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
          local hl = "%#StKernel#"
          local icon = " " --        
          return hl .. icon --[[  .. " " ]]
        end)()
      )

      table.insert(
        modules,
        8,
        (function()
          local hl = "%#StCodeium#"
          local icon = "" -- 󱜙  󰘦

          if status.codeium then
            icon = hl .. "󱜙" .. group_margin
          end

          return icon
        end)()
      )

      table.insert(
        modules,
        8,
        (function()
          local hl = "%#StDiscord#"
          local icon = ""
          if status.discord then
            icon = hl .. "󰙯" .. group_margin
          end
          return icon
        end)()
      )

      table.insert(
        modules,
        8,
        (function()
          local hl = "%#StGit#"
          local icon = ""
          if status.git then
            icon = hl .. "" .. group_margin
          end
          return icon
        end)()
      )

      table.insert(
        modules,
        8,
        (function()
          local hl = "%#StGithub#"
          local icon = ""
          if status.github then
            icon = hl .. "" .. group_margin
          end
          return icon
        end)()
      )
    end,
  },

  nvdash = {
    load_on_startup = true,

    buttons = {
      {
        "  New Project",
        "Spc n n",
        "ProjectNew",
      },
      {
        "󰁯  Restore Session",
        "Spc q l",
        function()
          require("persistence").load { last = true }
        end,
      },
      {
        "  File Manager",
        "Spc .",
        "Telescope file_browser path=%:p:h select_buffer=true",
        -- FIXME cmd doesn't work with lazy loading!
      },
      {
        "  Find File",
        "Spc f f",
        "Telescope find_files",
      },
      {
        "  Find Project",
        "Spc f p",
        "lua require('telescope').extensions.project.project({display_type = 'full'})",
      },
      {
        "󰈚  Recent Files",
        "Spc f r",
        "Telescope oldfiles",
      },
      {
        "  Bookmarks",
        "Spc m a",
        "Telescope marks",
      },
      {
        "  Themes",
        "Spc h t",
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
