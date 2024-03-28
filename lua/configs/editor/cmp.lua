return {

  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- setup cmp for autopairs
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },

    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      ft = { "vue", "typescript", "typescriptreact", "javascript", "javascriptreact", "astro", "svelte" },
      -- event = "VeryLazy",
      config = function()
        require("tailwindcss-colorizer-cmp").setup {
          color_square_width = 2,
        }
      end,
    },

    {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      opts = {
        history = true,
        updateevents = "TextChanged,TextChangedI",
      },

      keys = {
        {
          "<C-s>",
          function()
            local ls = require "luasnip"
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end,

          mode = { "i", "s" },
          silent = true,
        },
      },
      -- config = function(_, opts)
      --   require("nvchad.configs.others").luasnip(opts)
      --   local ls = require "luasnip"
      -- end,
    },

    -- cmp sources plugins
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "ray-x/lsp_signature.nvim", -- lsp signature help when typing
    "ray-x/cmp-treesitter",
    "delphinus/cmp-ctags",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
  },
  opts = {
    mapping = {
      ["<Tab>"] = require("cmp").mapping(function(fallback)
        fallback()
      end, {
        "i",
        "s",
      }),

      ["<S-Tab>"] = require("cmp").mapping(function(fallback)
        fallback()
      end, {
        "i",
        "s",
      }),
    },

    sources = {
      -- -- AI
      { name = "codeium" },
      -- { name = "cmp_tabnine" },

      -- Other Sources
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "luasnip" },
      { name = "buffer" },

      -- Cargo.toml
      { name = "crates" },

      -- Other
      -- { name = "orgmode" },
      -- { name = "calc" },
    },
  },
}
