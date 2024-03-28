return {
  "stevearc/conform.nvim",
  event = "BufRead",
  config = function()
    require("conform").setup {
      lsp_fallback = true,
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        lua = { "stylua" },
        json = { "prettier" },
        yaml = { "yamlfmt" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        fish = { "fish_indent" },
        cpp = { "clang_format" },
        c = { "clang_format" },
        vue = { { "prettierd", "prettier" } },
        ["_"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }

    local map = vim.keymap.set
    map("n", "<leader>cf", function()
      require("conform").format()
    end, { desc = "Conform - Fromat Buffer", noremap = true, silent = true })
  end,
}
