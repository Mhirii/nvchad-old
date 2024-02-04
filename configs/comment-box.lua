return {
  "LudoPinelli/comment-box.nvim",
  config = function(_, opts)
    require("comment-box").setup(opts)
  end,

  keys = {
    {
      "<leader>bb",
      function()
        require("comment-box").ccbox()
      end,
      mode = { "n", "v" },
      desc = "Comment Box",
    },

    {
      "<leader>be",
      function()
        -- take an input:
        local input = vim.fn.input "Catalog: "
        require("comment-box").ccbox(input)
      end,
      mode = { "n", "v" },
      desc = "Left Comment Box",
    },

    {
      "<leader>bt",
      function()
        require("comment-box").llline()
      end,
      mode = { "n", "v" },
      desc = "Left Comment Box",
    },

    {
      "<leader>bx",
      function()
        require("comment-box").catalog()
      end,
      mode = { "n", "v" },
      desc = "Comment Catalog",
    },
  },

  opts = {
    doc_width = 80, -- width of the document
    box_width = 60, -- width of the boxes
    borders = { -- symbols used to draw a box
      top = "─",
      bottom = "─",
      left = "│",
      right = "│",
      top_left = "╭",
      top_right = "╮",
      bottom_left = "╰",
      bottom_right = "╯",
    },
    line_width = 64, -- width of the lines
    line = { -- symbols used to draw a line
      line = "─",
      line_start = "─",
      line_end = "─",
    },
    outer_blank_lines = false, -- insert a blank line above and below the box
    inner_blank_lines = false, -- insert a blank line above and below the text
    line_blank_line_above = false, -- insert a blank line above the line
    line_blank_line_below = false, -- insert a blank line below the line
  },
}
