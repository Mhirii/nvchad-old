return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- ── lua ─────────────────────────────────────────────────────────
      "lua-language-server",
      "stylua",

      -- ── web dev ─────────────────────────────────────────────────────
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "tailwindcss-language-server",
      "vue-language-server",
      "prettierd",
      "eslint_d",
      "biome",

      -- ── programming ─────────────────────────────────────────────────
      -- rust
      "rust-analyzer",
      -- Go
      "gopls",
      "goimports",
      "impl",
    },
  },
}
