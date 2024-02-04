return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    {
      "<leader>sa",
      function()
        require("smart-splits").setup()
      end,
      desc = " Toggle Smart Splits",
    },
  },
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
  end,
}
