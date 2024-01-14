local M ={}

    M.dependencies = {
      "nvim-treesitter/nvim-treesitter",
    }

    M.keys = {
      {
        "<leader>jj",
        function()
          require("treesj").toggle()
        end,
        mode = "n",
        desc = "Toggle Treesitter Unjoin",
      },

      {
        "<leader>js",
        function()
          require("treesj").split()
        end,
        mode = "n",
        desc = "Treesitter Split",
      },

      {
        "<leader>jl",
        function()
          require("treesj").join()
        end,
        mode = "n",
        desc = "Treesitter Join Line",
      },
    }


    M.opts = {
      use_default_keymaps = false,
      max_join_length = 220, -- 120 is not sufficient
    }

return M
