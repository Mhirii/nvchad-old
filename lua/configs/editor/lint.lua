return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    require("lint").linters_by_ft = {
      typescript = { "eslint" },
      javascript = { "eslint" },
      -- lua = { "luacheck" },
      json = { "jsonlint" },
      yaml = { "yamllint" },
      markdown = { "markdownlint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      fish = { "fish" },
      cpp = { "ccpcheck" },
      c = { "ccpcheck" },
      vue = { "eslint_d" },
      -- typos
    }
  end,
}
