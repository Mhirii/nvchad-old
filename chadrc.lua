local M = {}

M.ui = require "custom.ui"

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

if vim.g.neovide then
  require "custom.neovide"
end

return M
