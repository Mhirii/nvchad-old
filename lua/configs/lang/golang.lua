return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod" },
  -- event = { "CmdlineEnter" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  config = function()
    local on_attach = require("override.lspconfig").on_attach

    require("go").setup {
      lsp_on_attach = on_attach,
      lsp_codelens = true,
      lsp_inlay_hints = {
        enable = true,
        -- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
        -- inlay only avalible for 0.10.x
        style = "inlay",
        -- Note: following setup only works for style = 'eol', you do not need to set it for 'inlay'
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refersh of the inlay hints.
        -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
        -- not that this may cause higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = "CursorHold",
        -- whether to show variable name before type hints with the inlay hints or not
        -- default: false
        show_variable_name = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "󰊕 ",
        show_parameter_hints = true,
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the lenght of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 6,
        -- The color of the hints
        highlight = "Comment",
      },
      floaterm = { -- position
        posititon = "auto", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
        width = 0.45, -- width of float window if not auto
        height = 0.98, -- height of float window if not auto
        title_colors = "tokyo", -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
        -- can also set to a list of colors to define colors to choose from
        -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
      },
      trouble = true, -- true: use trouble to open quickfix
      test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
      luasnip = true, -- enable included luasnip snippets
    }

    -- Run gofmt on save
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").gofmt()
      end,
      group = format_sync_grp,
    })

    local map = vim.keymap.set
    map("n", "<leader>lst", "<CMD>GoFillStruct<CR>", { desc = "Go - FillStruct", noremap = true, silent = true })
    map("n", "<leader>lsw", "<CMD>GoFillSwitch<CR>", { desc = "Go - FillSwitch", noremap = true, silent = true })
    map("n", "<leader>lif", "<CMD>GoIfErr<CR>", { desc = "Go - IfErr", noremap = true, silent = true })
    map("n", "<leader>lm", "<CMD>GoMake<CR>", { desc = "Go - Async Make", noremap = true, silent = true })
    map("n", "<leader>lr", "<CMD>GoRun<CR>", { desc = "Go - Run", noremap = true, silent = true })
    map("n", "<leader>lt", "<CMD>GoTest<CR>", { desc = "Go - Test", noremap = true, silent = true })
    map("n", "<leader>lw", "<CMD>GoTestSum -w<CR>", { desc = "Go - Test Watch", noremap = true, silent = true })
    map("n", "<leader>lx", "<CMD>GoTermClose<CR>", { desc = "Go - Close Term", noremap = true, silent = true })
    map("n", "<leader>lk", "<CMD>GoDoc<CR>", { desc = "Go - Doc", noremap = true, silent = true })
    map("n", "<leader>lat", "<CMD>GoAddTag<CR>", { desc = "Go - Add Tag", noremap = true, silent = true })
    map("n", "<leader>ldt", "<CMD>GoRmTag<CR>", { desc = "Go - Remove Tag", noremap = true, silent = true })
    map("n", "<leader>lc", function()
      require("go.comment").gen()
    end, { desc = "Go - Comment", noremap = true, silent = true })
    map("n", "<leader>ll", "<CMD>GoRmTag<CR>", { desc = "Go - Remove Tag", noremap = true, silent = true })
    map(
      "n",
      "<leader>li",
      "<CMD>GoToggleInlay<CR>",
      { desc = "Go - Toggle Inlay Hints", noremap = true, silent = true }
    )
  end,
}
