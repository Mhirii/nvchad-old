local s = require "settings"

return {
  { import = "configs.lspconfig" },
  { import = "configs.whichkey" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Editor
  { import = "configs.editor.garbage_day", enabled = true },
  { import = "configs.editor.telescope", enabled = true },
  { import = "configs.editor.neotree", enabled = true },
  { import = "configs.editor.cmp", enabled = true },
  { import = "configs.editor.mini", enabled = true },
  { import = "configs.editor.conform", enabled = true },
  { import = "configs.editor.lint", enabled = s.editor.linter },
  { import = "configs.editor.aerial", enabled = s.editor.aerial },
  { import = "configs.editor.copilot", enabled = s.editor.copilot },
  { import = "configs.editor.copilot_chat", enabled = s.editor.copilot_chat },
  { import = "configs.editor.inc_rename", enabled = s.editor.inc_rename },
  { import = "configs.editor.oil", enabled = s.editor.oil },
  { import = "configs.editor.smart_splits", enabled = s.editor.smart_splits },
  { import = "configs.editor.session", enabled = s.editor.sessions },
  { import = "configs.editor.workspaces", enabled = s.editor.sessions },
  { import = "configs.editor.goto_preview", enabled = s.editor.lsp_preview },

  -- Languages
  { import = "configs.lang.typescript", enabled = s.lang.typescript },
  { import = "configs.lang.hyprlang", enabled = s.lang.hyprlang },
  { import = "configs.lang.markdown", enabled = s.lang.markdown },
  { import = "configs.lang.golang", enabled = s.lang.go },

  -- Motions
  { import = "configs.motions.hop", enabled = s.motions.hop },
  { import = "configs.motions.marks", enabled = s.motions.marks },
  { import = "configs.motions.harpoon", enabled = s.motions.harpoon },

  -- UI
  { import = "configs.ui.dressing", enabled = true },
  { import = "configs.ui.bqf", enabled = true },
  { import = "configs.ui.illuminate", enabled = s.ui.illuminate },
  { import = "configs.ui.neoscroll", enabled = s.ui.smooth_scroll },
  { import = "configs.ui.noice", enabled = s.ui.noice },
  { import = "configs.ui.trouble", enabled = s.ui.trouble },
  { import = "configs.ui.ufo", enabled = s.ui.ufo },
  { import = "configs.ui.windows", enabled = s.ui.windows },
  { import = "configs.ui.hlslens", enabled = s.ui.hlslens },

  -- Utility
  { import = "configs.utility.lazygit", enabled = true },
  { import = "configs.utility.numb", enabled = true },
  { import = "configs.utility.zoxide", enabled = true },
  { import = "configs.utility.hawtkey", enabled = true },
  { import = "configs.utility.toggler", enabled = true },
  { import = "configs.utility.better_escape", enabled = true },
  { import = "configs.utility.comment_box", enabled = s.utility.comment_box },
  { import = "configs.utility.lsplines", enabled = s.utility.lsplines },
  { import = "configs.utility.nerdy", enabled = s.utility.nerdy },
  { import = "configs.utility.pomo", enabled = s.utility.pomodoro },
  { import = "configs.utility.todo_comments", enabled = s.utility.todo_comments },
  { import = "configs.utility.flote", enabled = s.utility.notes },
}
