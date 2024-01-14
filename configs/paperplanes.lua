local M = {}

M.keys = {}

M.opts = {
  register = "+",
  provider = "0x0.st",
  provider_options = {},
  notifier = vim.notify or print,
}

return M
