return {
  "NvChad/nvterm",
  init = function()
    require("core.utils").load_mappings "nvterm"
  end,
  config = function(_, opts)
    require "base46.term"
    require("nvterm").setup(opts)
  end,
  opts = {
    terminals = {
      shell = vim.o.shell,
      list = {},
      type_opts = {
        float = {
          relative = "editor",
          row = 0.1,
          col = 0.1,
          width = 0.8,
          height = 0.7,
          border = "single",
        },
        horizontal = { location = "rightbelow", split_ratio = 0.3 },
        vertical = { location = "rightbelow", split_ratio = 0.35 },
      },
    },
    behavior = {
      autoclose_on_quit = {
        enabled = false,
        confirm = true,
      },
      close_on_exit = true,
      auto_insert = true,
    },
  },
}
