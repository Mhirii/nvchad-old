return {
  "LudoPinelli/comment-box.nvim",
  config = function(_, opts)
    require("comment-box").setup(opts)
  end,

  keys = {
    {
      "<leader>bx",
      function()
        require("comment-box").ccbox()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Box Center",
    },
    {
      "<leader>bbl",
      function()
        require("comment-box").labox()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Box Left",
    },
    {
      "<leader>bbc",
      function()
        require("comment-box").cabox()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Box Center",
    },
    {
      "<leader>bbr",
      function()
        require("comment-box").rabox()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Box Right",
    },

    {
      "<leader>bt",
      function()
        require("comment-box").llline()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Line Left",
    },
    {
      "<leader>bll",
      function()
        require("comment-box").llline()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Line Left",
    },
    {
      "<leader>blc",
      function()
        require("comment-box").lcline()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Line Center",
    },
    {
      "<leader>blr",
      function()
        require("comment-box").lrline()
      end,
      mode = { "n", "v" },
      desc = "CommentBox - Line Right",
    },
    {
      "<leader>bB",
      "<CMD>CBd<CR>",
      mode = { "n", "v" },
      desc = "CommentBox - Delete",
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
