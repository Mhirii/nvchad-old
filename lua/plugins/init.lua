local s = require "settings"

return {
  { import = "configs.lspconfig" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Editor
  { import = "configs.editor.telescope" },
  { import = "configs.editor.neotree" },
  { import = "configs.editor.cmp" },
  { import = "configs.editor.conform" },
  { import = "configs.editor.lint" },
  { import = "configs.editor.aerial" },
  { import = "configs.editor.copilot" },
  { import = "configs.editor.copilot_chat" },
  { import = "configs.editor.inc_rename" },
  { import = "configs.editor.mini" },
  { import = "configs.editor.oil" },
  { import = "configs.editor.smart_splits" },

  -- Languages
  { import = "configs.lang.typescript" },
  { import = "configs.lang.hyprlang" },

  -- Motions
  { import = "configs.motions.hop" },
  { import = "configs.motions.marks" },

  -- UI
  { import = "configs.ui.dressing" },
  { import = "configs.ui.illuminate" },
  { import = "configs.ui.neoscroll" },
  { import = "configs.ui.noice" },
  { import = "configs.ui.trouble" },
  { import = "configs.ui.ufo" },
  { import = "configs.ui.windows" },

  -- Utility
  { import = "configs.utility.better_escape" },
  { import = "configs.utility.comment_box" },
  { import = "configs.utility.hawtkey" },
  { import = "configs.utility.lazygit" },
  { import = "configs.utility.lsplines" },
  { import = "configs.utility.nerdy" },
  { import = "configs.utility.numb" },
  { import = "configs.utility.pomo" },
  { import = "configs.utility.todo_comments" },
  { import = "configs.utility.toggler" },
  { import = "configs.utility.zoxide" },
}
