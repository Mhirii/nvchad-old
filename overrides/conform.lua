return {
  "stevearc/conform.nvim",

  config = function()
    require("conform").setup {
      lsp_fallback = true,

      formatters_by_ft = {
        lua = { "stylua" },

        -- Use a sub-list to run only the first available formatter
        javascript = { "biome" },
        vue = { { "prettierd", "prettier" } },

        css = { "prettier" },
        html = { "prettier" },

        sh = { "shfmt" },
        fish = { "fish_indent" },

        -- go = { "goimports", "gofmt", "golines" },
        go = {},

        ["*"] = { "codespell" },
        -- "_" filetype to format on filetypes that aren't configured.
        ["_"] = { "trim_whitespace" },
      },

      -- adding same formatter for multiple filetypes can look too much work for some
      -- instead of the above code you could just use a loop! the config is just a table after all!

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }
  end,
}
