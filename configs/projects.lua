return {
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  "ahmedkhalf/project.nvim",
  -- lazy = false,
  opts = {
    manual_mode = true,
    patterns = {
      ".git",
      -- "Cargo.toml",
      -- "CMakeLists.txt",
      -- ".vscode",
      -- ".svn",
      -- "Makefile",
      -- "package.json",
    },
    show_hidden = true,
    -- Path where project.nvim will store the project history for use in telescope
    datapath = vim.fn.stdpath "data",
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension "projects"
  end,
}
