return {
  "phaazon/hop.nvim",
  event = "VeryLazy",
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    local hop = require "hop"
    local directions = require("hop.hint").HintDirection
    vim.keymap.set("", "<M-f>", function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false }
    end, { remap = true })
    vim.keymap.set("", "<M-F>", function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false }
    end, { remap = true })
    vim.keymap.set("", "<M-t>", function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
    end, { remap = true })
    vim.keymap.set("", "<M-T>", function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
    end, { remap = true })
  end,

  keys = {
    { "<leader>hw", mode = { "n", "v" }, "<Cmd>HopWord <cr>" },
    { "<leader>h/", mode = { "n", "v" }, "<Cmd>HopPattern <cr>" },
    { "<leader>he", mode = { "n", "v" }, "<Cmd>HopAnywhere <cr>" },
    { "<leader>hc", mode = { "n", "v" }, "<Cmd>HopChar1 <cr>" },
    { "<leader>hv", mode = { "n", "v" }, "<Cmd>HopVertical <cr>" },
    { "<leader>hs", mode = { "n", "v" }, "<Cmd>HopChar2 <cr>" },
    { "<M-s>", mode = { "n", "v" }, "<Cmd>HopWord <cr>" },
    { "<M-S>", mode = { "n", "v" }, "<Cmd>HopLine <cr>" },
  },
}
