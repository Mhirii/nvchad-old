return {
  "rasulomaroff/reactive.nvim",
  event = "VeryLazy",
  config = function()
    require("reactive").add_preset {
      name = "rosepine",
      init = function()
        vim.opt.cursorline = true
      end,
      static = {
        winhl = {
          inactive = {
            CursorLine = { bg = "#222228" },
            CursorLineNr = { fg = "#b0b0b0", bg = "#222228" },
          },
        },
      },
      modes = {
        no = {
          operators = {
            -- switch case
            [{ "gu", "gU", "g~", "~" }] = {
              winhl = {
                CursorLine = { bg = "#334155" },
                CursorLineNr = { fg = "#cbd5e1", bg = "#334155" },
              },
            },
            -- change
            c = {
              winhl = {
                CursorLine = { bg = "#162044" },
                CursorLineNr = { fg = "#93c5fd", bg = "#162044" },
              },
            },
            -- delete
            d = {
              winhl = {
                CursorLine = { bg = "#350808" },
                CursorLineNr = { fg = "#eb6f92", bg = "#b4637a" },
              },
            },
            -- yank
            y = {
              winhl = {
                CursorLine = { bg = "#231e2a" },
                CursorLineNr = { fg = "#f6c177", bg = "#2b242f" },
              },
            },
          },
        },
        i = {
          winhl = {
            CursorLine = { bg = "#1f1d2e" },
            CursorLineNr = { fg = "#3e8fb0", bg = "#1f1d2e" },
          },
        },
        n = {
          winhl = {
            CursorLine = { bg = "#1f1d2e" },
            CursorLineNr = { fg = "#ffffff", bg = "#1f1d2e" },
          },
        },
        -- visual
        [{ "v", "V", "\x16" }] = {
          winhl = {
            CursorLineNr = { fg = "#c4a7e7", bg = "#2e2438" },
            Visual = { bg = "#2e2438" },
          },
        },
        -- replace
        R = {
          winhl = {
            CursorLine = { bg = "#26233a" },
            CursorLineNr = { fg = "#eb6f92", bg = "#26233a" },
          },
        },
      },
    }
    require("reactive").load_preset "rosepine"
  end,
}
