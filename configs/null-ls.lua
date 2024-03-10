local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
local b = null_ls.builtins

local opts = {
  sources = {

    b.code_actions.refactoring,
    b.code_actions.gomodifytags,
    b.formatting.tidy,

    -- All
    b.diagnostics.codespell, -- Smart spell checker, Does not check code, checks text. (comment only probably)
    b.code_actions.shellcheck,
    -- b.diagnostics.todo_comments,
    b.diagnostics.trail_space,
    b.completion.luasnip,

    -- Json
    b.formatting.fixjson,

    -- TOML
    b.formatting.taplo,

    -- Lua
    b.formatting.stylua,

    -- Shell
    b.formatting.shfmt,
    b.formatting.fish_indent,
    b.code_actions.shellcheck,
    b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
    b.diagnostics.fish,

    -- Rust
    b.formatting.rustfmt, -- TODO: rust-tools.nvim

    -- TS
    -- b.code_actions.xo,
    b.formatting.biome.with {
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    },
    b.formatting.prettierd.with {
      filetypes = { "vue", "css", "scss", "less", "html", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" },
    },
    b.code_actions.eslint_d.with {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    },
    -- b.diagnostics.eslint_d.with {
    --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    -- },

    -- golang
    b.code_actions.impl,
    b.formatting.gofmt,
    b.formatting.goimports,

    -- dictionary
    b.hover.dictionary,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
