return {
  "phaazon/hop.nvim",
  keys = {
    { "<leader>hw", "<Cmd>HopWord <cr>", mode = { "n", "v" }, desc = "Hop - Word" },
    { "<leader>h/", "<Cmd>HopPattern <cr>", mode = { "n", "v" }, desc = "Hop - Pattern" },
    { "<leader>hc", "<Cmd>HopChar1 <cr>", mode = { "n", "v" }, desc = "Hop - Character" },
    { "<leader>hs", "<Cmd>HopChar2 <cr>", mode = { "n", "v" }, desc = "Hop - 2 Characters" },
    { "<M-f>", "<Cmd>HopChar1 <cr>", mode = { "n", "v" }, desc = "Hop - Character" },
  },
  config = function()
    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
  end,
}
