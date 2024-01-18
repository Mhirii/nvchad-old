return {
  "dmmulroy/tsc.nvim",
  cmd = { "TSC" },
  config = function()
    require("tsc").setup {
      auto_open_qflist = true,
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      -- spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
      auto_close_qflist = false,
      auto_focus_qflist = false,
      auto_start_watch_mode = false,
      enable_progress_notifications = true,
      hide_progress_notifications_from_history = true,
      pretty_errors = true,
    }
  end,
}
