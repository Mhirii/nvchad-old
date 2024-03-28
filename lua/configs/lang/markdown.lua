return {
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    keys = {
      { "<leader>mp", ":Glow<CR>", mode = "n", desc = "Glow - Preview Markdown" },
    },
    enabled = true,
    config = function()
      require("glow").setup {
        -- border = "shadow", -- floating window border config
        -- style = "dark|light", -- filled automatically with your current editor background, you can override using glow json style
        -- pager = false,
        -- width = 80,
        -- height = 100,
        -- width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
        -- height_ratio = 0.7,
      }
    end,
  },
  {
    "toppair/peek.nvim",
    enabled = true,
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    keys = {
      { "<leader>md", ":PeekOpen<CR>", mode = "n", desc = "Peek - Open Markdown Preview" },
      { "<leader>mc", ":PeekClose<CR>", mode = "n", desc = "Peek - Close Markdown Preview" },
    },
    config = function()
      -- default config:
      require("peek").setup {
        -- auto_load = true, -- whether to automatically load preview when
        -- -- entering another markdown buffer
        -- close_on_bdelete = true, -- close preview window on buffer delete
        --
        -- syntax = true, -- enable syntax highlighting, affects performance
        --
        -- theme = "dark", -- 'dark' or 'light'
        --
        -- update_on_change = true,
        --
        -- app = "browser", -- 'webview', 'browser', string or a table of strings
        -- -- explained below
        --
        -- filetype = { "markdown" }, -- list of filetypes to recognize as markdown
        --
        -- -- relevant if update_on_change is true
        -- throttle_at = 200000, -- start throttling when file exceeds this
        -- -- amount of bytes in size
        -- throttle_time = "auto", -- minimum amount of time in milliseconds
        -- -- that has to pass before starting new render
      }
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}
