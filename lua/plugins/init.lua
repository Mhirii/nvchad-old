local s = require "settings"

return {
  { import = "configs.lspconfig" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Editor
  { import = "configs.editor.telescope" },
  { import = "configs.editor.neotree" },
  { import = "configs.editor.cmp" },
  { import = "configs.editor.mini" },
  { import = "configs.editor.conform", enabled = s.editor.formatter == "conform" },
  { import = "configs.editor.lint", enabled = s.editor.linter },
  { import = "configs.editor.aerial", enabled = s.editor.aerial },
  { import = "configs.editor.copilot", enabled = s.editor.copilot },
  { import = "configs.editor.copilot_chat", enabled = s.editor.copilot_chat },
  { import = "configs.editor.inc_rename", enabled = s.editor.inc_rename },
  { import = "configs.editor.oil", enabled = s.editor.oil },
  { import = "configs.editor.smart_splits", enabled = s.editor.smart_splits },

  -- Languages
  { import = "configs.lang.typescript", enabled = s.lang.typescript },
  { import = "configs.lang.hyprlang", enabled = s.lang.hyprlang },

  -- Motions
  { import = "configs.motions.hop", enabled = s.motions.hop },
  { import = "configs.motions.marks", enabled = s.motions.marks },

  -- UI
  { import = "configs.ui.dressing" },
  { import = "configs.ui.illuminate", enabled = s.ui.illuminate },
  { import = "configs.ui.neoscroll", enabled = s.ui.smooth_scroll },
  { import = "configs.ui.noice", enabled = s.ui.noice },
  { import = "configs.ui.trouble", enabled = s.ui.trouble },
  { import = "configs.ui.ufo", enabled = s.ui.ufo },
  { import = "configs.ui.windows", enabled = s.ui.windows },

  -- Utility
  { import = "configs.utility.lazygit" },
  { import = "configs.utility.numb" },
  { import = "configs.utility.zoxide" },
  { import = "configs.utility.hawtkey" },
  { import = "configs.utility.toggler" },
  { import = "configs.utility.better_escape" },
  { import = "configs.utility.comment_box", enabled = s.utility.comment_box },
  { import = "configs.utility.lsplines", enabled = s.utility.lsplines },
  { import = "configs.utility.nerdy", enabled = s.utility.nerdy },
  { import = "configs.utility.pomo", enabled = s.utility.pomodoro },
  { import = "configs.utility.todo_comments", enabled = s.utility.todo_comments },
}