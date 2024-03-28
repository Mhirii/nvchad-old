return {
  "zeioth/garbage-day.nvim",
  dependencies = "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    aggressive_mode = false,
    excluded_lsp_clients = { "copilot" },
    grace_period = 60 * 30,
    wakeup_delay = 0,
  },
}
