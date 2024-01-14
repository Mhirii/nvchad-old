local M = {}

M.opts = function()
  return {
    setup = {
      -- Directory which contains all of your projects
      project_path = "~/repos", -- TODO: Ask for user input + migrate to init.lua
    },
    templates = {
      {
        name = "TypeScript (React + Next.js)",
        repo = "cruip/open-react-template",
        opts = {
          pull = true,
        },
      },
      {
        name = "Go (Kratos)",
        repo = "go-kratos/kratos-layout",
        opts = {
          pull = true,
        },
      },
      {
        name = "Go (Makefile)",
        repo = "thockin/go-build-template",
        opts = {
          pull = true,
        },
      },
      {
        name = "Rust",
        expand = "cargo init",
      },
    },
  }
end

M.keys = {
  -- { -- Using <leader>fp is suggested
  --   "<leader>pf",
  --   "<cmd> ProjectOpen<CR>",
  --   mode = "n",
  --   desc = "Project",
  -- },
  {
    "<leader>nn",
    "<cmd> ProjectNew<CR>",
    mode = "n",
    desc = "New Project",
  },
}

M.config = function(_, opts)
  require("neoproj").setup(opts.setup)
  for _, template in ipairs(opts.templates) do
    if template.repo then
      require("neoproj").register_template {
        name = template.name,
        expand = function()
          -- vim.cmd ":Telescope file_browser path=%:p:h select_buffer=true<CR>"
          local cmd = require("neoproj").create_project(template.repo, template.opts)
          os.execute(cmd)
        end,
      }
    else
      require("neoproj").register_template(template)
    end
  end
end

return M
