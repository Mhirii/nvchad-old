return {
  "folke/persistence.nvim",
  lazy = false,
  -- event = "BufReadPre", -- this will only start session saving when an actual file was opened
  -- restore the session for the current directory
  keys = {
    {
      "<leader>qs",
      function()
        require("persistence").load()
      end,
      mode = "n",
      desc = "Load Session",
    },
    -- restore the last session
    {
      "<leader>ql",
      function()
        require("persistence").load { last = true }
      end,
      mode = "n",
      desc = "Restore Session",
    },
    -- stop Persistence => session won't be saved function()on exit
    {
      "<leader>qd",
      function()
        require("persistence").stop()
      end,
      desc = "Stop Session Save",
      mode = "n",
    },
  },
  opts = {},
}
