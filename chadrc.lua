---@type ChadrcConfig
local M = {}

M.ui = require "custom.ui"

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

if vim.g.neovide then
  require "custom.neovide"
end

return M
