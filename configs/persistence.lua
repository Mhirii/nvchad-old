local M ={}

M.keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        mode = "n",
        desc = "Save Session",
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
    }

    M.opts = {
      -- add any custom options here
    }

return M
