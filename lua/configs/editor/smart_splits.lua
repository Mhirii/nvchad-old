return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function()
    require("smart-splits").setup {
      ignored_buftypes = { "NvimTree" },
      resize_mode = {
        -- key to exit persistent resize mode
        quit_key = "<ESC>",
        -- keys to use for moving in resize mode
        -- in order of left, down, up' right
        resize_keys = { "h", "j", "k", "l" },
        -- set to true to silence the notifications
        -- when entering/exiting persistent resize mode
        silent = false,
        -- must be functions, they will be executed when
        -- entering or exiting the resize mode
        hooks = {
          on_enter = nil,
          on_leave = nil,
        },
      },
      -- enable or disable a multiplexer integration;
      -- automatically determined, unless explicitly disabled or set,
      -- by checking the $TERM_PROGRAM environment variable,
      -- and the $KITTY_LISTEN_ON environment variable for Kitty
      multiplexer_integration = nil,
      -- Supply a Kitty remote control password if needed,
      -- or you can also set vim.g.smart_splits_kitty_password
      -- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
      kitty_password = nil,
      -- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
      log_level = "info",
    }

    local map = vim.keymap.set

    map("n", "<C-h>", function()
      require("smart-splits").move_cursor_left()
    end, { desc = "SmartSplits - Focus Left" })
    map("n", "<C-j>", function()
      require("smart-splits").move_cursor_down()
    end, { desc = "SmartSplits - Focus Down" })
    map("n", "<C-k>", function()
      require("smart-splits").move_cursor_up()
    end, { desc = "SmartSplits - Focus Up" })
    map("n", "<C-l>", function()
      require("smart-splits").move_cursor_right()
    end, { desc = "SmartSplits - Focus Right" })

    map("n", "<A-left>", function()
      require("smart-splits").resize_left()
    end, { desc = "SmartSplits - Resize Left" })
    map("n", "<A-down>", function()
      require("smart-splits").resize_down()
    end, { desc = "SmartSplits - Resize Down" })
    map("n", "<A-up>", function()
      require("smart-splits").resize_up()
    end, { desc = "SmartSplits - Resize Up" })
    map("n", "<A-right>", function()
      require("smart-splits").resize_right()
    end, { desc = "SmartSplits - Resize Right" })

    map("n", "<A-h>", function()
      require("smart-splits").resize_left()
    end, { desc = "SmartSplits - Resize Left" })
    map("n", "<A-j>", function()
      require("smart-splits").resize_down()
    end, { desc = "SmartSplits - Resize Down" })
    map("n", "<A-k>", function()
      require("smart-splits").resize_up()
    end, { desc = "SmartSplits - Resize Up" })
    map("n", "<A-l>", function()
      require("smart-splits").resize_right()
    end, { desc = "SmartSplits - Resize Right" })

    map("n", "<leader><leader>h", function()
      require("smart-splits").swap_buf_left()
    end, { desc = "SmartSplits - Swap Buffer Left" })
    map("n", "<leader><leader>j", function()
      require("smart-splits").swap_buf_down()
    end, { desc = "SmartSplits - Swap Buffer Down" })
    map("n", "<leader><leader>k", function()
      require("smart-splits").swap_buf_up()
    end, { desc = "SmartSplits - Swap Buffer Up" })
    map("n", "<leader><leader>l", function()
      require("smart-splits").swap_buf_right()
    end, { desc = "SmartSplits - Swap Buffer Right" })
  end,
}
