local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                        Overrides                        │
  --          ╰─────────────────────────────────────────────────────────╯

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        opts = function()
          return require "custom.configs.null-ls"
        end,
      },
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    enabled = false,
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    event = "BufRead",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = require("custom.configs.cmp").dependencies,
    opts = require("custom.configs.cmp").opts,
  },

  {
    "folke/which-key.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      require("custom.configs.whichkey").prefixes()
    end,
    opts = require("custom.configs.whichkey").opts,
  },

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                           LSP                           │
  --          ╰─────────────────────────────────────────────────────────╯

  {
    "nvimdev/lspsaga.nvim",
    opts = require "custom.configs.lspsaga",
    keys = {
      {
        "<leader>ul",
        "",
        mode = "n",
        desc = "Enable Lsp Saga",
      },
    },
  },

  {
    "andersevenrud/nvim_context_vt",
    dependencies = "nvim-treesitter",
    config = function(_, opts)
      require("nvim_context_vt").setup(opts)
      vim.cmd [[NvimContextVtToggle]]
    end,

    keys = require("custom.configs.context-vt").keys,
    opts = require("custom.configs.context-vt").opts,
  },

  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
  },

  {
    "pmizio/typescript-tools.nvim",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = function()
      require "custom.configs.ts"
    end,
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {
      auto_open_qflist = true,
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
    },
  },

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                           UI                            │
  --          ╰─────────────────────────────────────────────────────────╯

  {
    "stevearc/dressing.nvim",
    config = function(_, opts)
      require("dressing").setup(opts)
    end,
    opts = require("custom.configs.dressing").opts,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      return require "custom.configs.noice"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    enabled = false,
  },

  { -- Smooth scrolling
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function(_, opts)
      require("neoscroll").setup(opts)
    end,
    opts = require("custom.configs.neoscroll").opts,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function(_, opts)
      require("symbols-outline").setup(opts)
    end,
    keys = require("custom.configs.symbols-outline").keys,
    opts = require("custom.configs.symbols-outline").opts,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = require "custom.configs.lsp-signature",
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = require "custom.configs.trouble",
  },

  { -- Folding. The fancy way
    "kevinhwang91/nvim-ufo",
    -- event = "VeryLazy",
    keys = require("custom.configs.ufo").keys,
    dependencies = require("custom.configs.ufo").dependencies,
    opts = require("custom.configs.ufo").opts,
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },

  {
    "Fildo7525/pretty_hover",
    opts = {},
  },

  { -- Lsp lens Show References, Definitions etc. as virtual text
    -- Not working smoothly in every language
    "VidocqH/lsp-lens.nvim",
    config = require "custom.configs.lsplens",
  },

  { -- Rust Cargo.toml integration
    -- https://github.com/Saecki/crates.nvim#functions
    "Saecki/crates.nvim",
    tag = "v0.3.0", -- Adventurous but Featureful
    event = "BufEnter Cargo.toml",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("crates").setup(opts)
    end,
    keys = require("custom.configs.rust").keys,
    opts = require("custom.configs.rust").opts,
  },

  { -- Note this plugin is written as dependency of quickfix plugins
    -- Prettier quickfix window
    "yorickpeterse/nvim-pqf",
    dependencies = {
      "kevinhwang91/nvim-bqf", --optional
    },
    config = function(_, opts)
      require("pqf").setup(opts)
    end,
    opts = require("custom.configs.pqf").opts,
  },

  {
    "mawkler/modicator.nvim",
    -- dependencies = "folke/tokyonight.nvim", -- Add your colorscheme plugin here
    event = "BufRead",
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    config = function(_, opts)
      require("modicator").setup(opts)
    end,
    opts = {
      -- Show warning if any required option is missing
      show_warnings = true,
      highlights = {
        -- Default options for bold/italic
        defaults = {
          bold = true,
          italic = false,
        },
      },
    },
  },

  { -- Better quickfix window including telescope integration, code view etc.
    -- TODO: improve this
    "kevinhwang91/nvim-bqf",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
      },
      { -- OPTIONAL for fuzzy searching TODO: Replace MAYBE
        "junegunn/fzf",
        build = function()
          vim.fn["fzf#install"]()
        end,
      },
      {
        "yorickpeterse/nvim-pqf",
      },
    },

    keys = require("custom.configs.nvim-bqf").keys,
    opts = require("custom.configs.nvim-bqf").opts,

    config = function(_, opts) -- TODO: add hlgroups
      require("bqf").setup(opts)
    end,
  },

  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,         -- Enable 'number' for the window while peeking
        show_cursorline = true,      -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only = false,         -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true,     -- Peeked line will be centered relative to window
      }
    end,
  },

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                         Utility                         │
  --          ╰─────────────────────────────────────────────────────────╯

  { -- One of the most useful plugins I've ever seen
    "rktjmp/paperplanes.nvim",
    event = "VeryLazy",
    keys = require("custom.configs.paperplanes").keys,
    config = function(_, opts)
      require("paperplanes").setup(opts)
    end,
    opts = require("custom.configs.paperplanes").opts,
  },

  {
    "nguyenvukhang/nvim-toggler",
    config = function()
      require("nvim-toggler").setup {
        inverses = {
          ["disable"] = "enable",
        },
      }
    end,
    keys = {
      {
        "<leader>i",
        mode = { "n", "v" },
        function()
          require("nvim-toggler").toggle()
        end,
        desc = "Toggle",
      },
    },
  },

  { -- TODO: Fix
    "iamcco/markdown-preview.nvim",
    ft = {
      "markdown",
    },
    build = ":call mkdp#util#install()",
    keys = {
      {
        "<leader>cmp",
        "<cmd>MarkdownPreviewToggle<cr>",
        mode = "n",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {                             -- Toggle case (CamelCase, snake_case, kebab-case, PascalCase, Title Case, UPPER CASE, lower case)
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
  },

  {
    "Wansmer/treesj",
    dependencies = require("custom.configs.treesj").dependencies,
    keys = require("custom.configs.treesj").keys,
    opts = require("custom.configs.treesj").opts,
    config = function(_, opts) --FIXME: fixme
      require("treesj").setup(opts)
    end,
  },

  { -- Built-in cheats
    -- AWESOME
    "sudormrfbin/cheatsheet.nvim",
    cmd = { "Cheatsheet" },
    keys = require("custom.configs.cheatsheet").keys,
    dependencies = require("custom.configs.cheatsheet").dependencies,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kevinhwang91/nvim-bqf",
    }, -- bqf is optional
    keys = require("custom.configs.todo-comments").keys,
    opts = require("custom.configs.todo-comments").opts,
  },

  {
    "LudoPinelli/comment-box.nvim",
    event = "VeryLazy",
    config = require("custom.configs.comment-box").config,
    keys = require("custom.configs.comment-box").keys,
    opts = require("custom.configs.comment-box").opts,
  },

  { -- FIXME: TODO: remove telescope override and write it as a dependency
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>P",
        "<cmd> Telescope lazy<CR>",
        desc = "Surf Plugins",
      },
    },
    dependencies = {
      {
        "jvgrootveld/telescope-zoxide",
        config = function()
          require("telescope").load_extension "zoxide"
        end,
        keys = {
          { "<leader>fZ", "<CMD>Telescope zoxide list<CR>" },
        },
      },
      {
        "tsakirist/telescope-lazy.nvim",
        opts = {
          extensions = {
            lazy = {
              -- Optional theme (the extension doesn't set a default theme)
              theme = "ivy",
              -- Whether or not to show the icon in the first column
              show_icon = true,
              -- Mappings for the actions
              mappings = {
                open_in_browser = "<C-o>",
                open_in_file_browser = "<M-b>",
                open_in_find_files = "<C-f>",
                open_in_live_grep = "<C-g>",
                open_plugins_picker = "<C-b>", -- Works only after having called first another action
                open_lazy_root_find_files = "<C-r>f",
                open_lazy_root_live_grep = "<C-r>g",
              },
              -- Other telescope configuration options
            },
          },
        },
      },
    },
  },

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                         Motions                         │
  --          ╰─────────────────────────────────────────────────────────╯

  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = require("custom.configs.hop").config,
    keys = require("custom.configs.hop").keys,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "chentoast/marks.nvim",
    dependencies = { "kevinhwang91/nvim-bqf" },
    event = "BufRead",
    config = require("custom.configs.marks").config,
    keys = require("custom.configs.marks").keys,
    opts = require("custom.configs.marks").opts,
  },

  {
    "echasnovski/mini.nvim",
    version = "false",
    event = "BufRead",
    config = require "custom.configs.surround",
  },

  {
    "ThePrimeagen/harpoon",
    -- event = "veryLazy",
    branch = "harpoon2",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require "custom.configs.harpoon"
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    opts = {
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
      },
    },
  },

  {
    "nanotee/zoxide.vim",
    event = "VeryLazy",
    dependencies = {
      "junegunn/fzf",
    },
  },

  --          ╭─────────────────────────────────────────────────────────╮
  --          │                          Gold                           │
  --          ╰─────────────────────────────────────────────────────────╯

  { -- Session Manager
    "folke/persistence.nvim",
    -- event = "BufReadPre", -- this will only start session saving when an actual file was opened
    -- restore the session for the current directory
    keys = require("custom.configs.persistence").keys,
    opts = require("custom.configs.persistence").opts,
  },

  { -- Glyph Picker
    "2kabhishek/nerdy.nvim",
    keys = require("custom.configs.nerdy").keys,
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },

  {                     -- Native Plugin (for of neoproj)
    "UTFeight/neoproj", -- TODO EXPLORE
    enabled = false,
    dependencies = {
      -- Just loading it after initialization
      -- not a plugin dependency
      "nvim-telescope/telescope-file-browser.nvim",
    },
    cmd = {
      "ProjectOpen",
      "ProjectNew",
    },

    config = require("custom.configs.neoproj").config,
    keys = require("custom.configs.neoproj").keys,
    opts = require("custom.configs.neoproj").opts,
  },

  {
    "mrjones2014/smart-splits.nvim",
    keys = require("custom.configs.smart-splits").keys,
    config = function()
      require("smart-splits").setup()
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    keys = {
      {
        "<leader>gg",
        "<cmd> LazyGit<CR>",
        mode = "n",
        desc = "LazyGit",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "ahmedkhalf/project.nvim",
    opts = require("custom.configs.project").opts,
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    keys = { [[<C-\>]] },
    cmd = { "ToggleTerm", "ToggleTermOpenAll", "ToggleTermCloseAll" },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 0.25 * vim.api.nvim_win_get_height(0)
        elseif term.direction == "vertical" then
          return 0.25 * vim.api.nvim_win_get_width(0)
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
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      autochdir = true,
      highlights = {
        NormalFloat = {
          link = "Normal",
        },
        FloatBorder = {
          link = "FloatBorder",
        },
      },
      float_opts = {
        border = "rounded",
        winblend = 0,
      },
    },
  },
}

-- TODO: wild cmp
-- TODO: tailwind rust ts vue

return plugins
