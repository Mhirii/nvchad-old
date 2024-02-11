local colors = require("base46").get_theme_tb "base_30"
return {
  "rasulomaroff/reactive.nvim",
  event = "VeryLazy",
  config = function()
    require("reactive").add_preset {
      name = "hypr",
      init = function()
        vim.opt.cursorline = true
      end,
      static = {
        winhl = {
          inactive = {
            CursorLine = { bg = colors.darker_black },
            CursorLineNr = { fg =colors.white, bg = colors.darker_black},
          },
        },
      },
      modes = {
        no = {
          operators = {
            -- switch case
            [{ "gu", "gU", "g~", "~" }] = {
              winhl = {
            CursorLine = { bg = colors.one_bg },
            CursorLineNr = { fg =colors.blue, bg = colors.black},
              },
            },
            -- change
            c = {
              winhl = {
            CursorLine = { bg = colors.one_bg },
            CursorLineNr = { fg =colors.yellow, bg = colors.black},
              },
            },
            -- delete
            d = {
              winhl = {
            CursorLine = { bg = colors.one_bg },
            CursorLineNr = { fg =colors.red, bg = colors.black},
              },
            },
            -- yank
            y = {
              winhl = {
            CursorLine = { bg = colors.one_bg },
            CursorLineNr = { fg =colors.green, bg = colors.black},
              },
            },
          },
        },
        i = {
          winhl = {
            CursorLine = { bg = colors.one_bg},
            CursorLineNr = { fg =colors.purple, bg = colors.black},
          },
        },
        n = {
          winhl = {
            CursorLine = { bg = colors.black },
            CursorLineNr = { fg =colors.white, bg = colors.black },
          },
        },
        -- visual
        [{ "v", "V", "\x16" }] = {
          winhl = {
            CursorLineNr = { fg =colors.cyan, bg = colors.black},
            Visual = { bg = colors.one_bg3},
          },
        },
        -- replace
        R = {
          winhl = {
            CursorLineNr = { fg =colors.red, bg = colors.black},
            CursorLine = { bg = colors.one_bg },
            Visual = { bg = colors.one_bg3},
          },
        },
      },
    }
    require("reactive").load_preset "hypr"
  end,
}
