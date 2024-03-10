return {                      -- Toggle case (CamelCase, snake_case, kebab-case, PascalCase, Title Case, UPPER CASE, lower case)
  "UTFeight/vim-case-change", -- FIXME
  keys = {
    -- NOTE: This is M-Shift-s actually.
    {
      "<M-S>",
      "<cmd>ToggleCase<cr>",
      mode = "v",
      desc = "Toggle Case",
    },
    {
      "<M-S>",
      "<ESC>viw<cmd>ToggleCase<cr>",
      mode = { "i", "n" },
      desc = "Toggle Case",
    },
  },
}
