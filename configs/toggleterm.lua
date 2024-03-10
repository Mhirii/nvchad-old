return {
  "akinsho/toggleterm.nvim",
  keys = { [[<C-\>]] },
  cmd = { "ToggleTerm", "ToggleTermOpenAll", "ToggleTermCloseAll" },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 0.5 * vim.api.nvim_win_get_height(0)
      elseif term.direction == "vertical" then
        return 0.5 * vim.api.nvim_win_get_width(0)
      elseif term.direction == "float" then
        return 85
      end
    end,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_terminals = false,
    insert_mappings = true,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal", --"vertical" | "horizontal" | "tab" | "float",
    close_on_exit = true,
    -- shell = vim.o.shell,
    shell = "fish",
    autochdir = true,
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    highlights = {
      Normal = {
        guibg = "#1A1B26",
      },
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        link = "FloatBorder",
        --     guifg = "<VALUE-HERE>",
        --     guibg = "<VALUE-HERE>",
      },
    },
    float_opts = {
      border = "rounded",
      winblend = 0,
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
}
