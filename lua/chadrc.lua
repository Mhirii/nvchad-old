vim.filetype.add {
  pattern = { [".*.conf"] = "hyprlang" },
}
vim.filetype.add {
  pattern = { [".*/hyprland%.conf"] = "hypr" },
}

require "autocmds"

if vim.g.neovide then
  require "neovide"
end

local function extract_time(text)
  local time_str = ""
  local found_space = false

  -- Iterate from the end of the string
  for i = string.len(text), 1, -1 do
    local char = string.sub(text, i, i)

    -- Check for whitespace or end of string
    if char == " " or i == 1 then
      found_space = true
      break
    end

    -- Append character only if not whitespace and space not found yet
    if char ~= " " and not found_space then
      time_str = char .. time_str -- Prepend character to build the time string
    end
  end

  -- Check if any time was extracted
  if time_str ~= "" then
    return time_str
  else
    return "" -- No time found
  end
end

local M = {}

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "rosepine" },

  cmp = {
    style = "atom_colored", -- flatt_dark | flat_light | default | atom | atom_colored
    selected_item_bg = "colored",
  },

  tabufline = {
    order = { "buffers", "tabs" },
  },

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",

    modules = {
      pomo = function()
        local icon = "󰄉 "
        local ok, pomo = pcall(require, "pomo")
        if not ok then
          return ""
        end
        local timer = pomo.get_first_to_finish()
        if not timer then
          return ""
        end
        local text = tostring(timer)
        local time = extract_time(text)
        return "%#St_Lsp#" .. " " .. icon .. time .. " "
      end,
    },

    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "pomo", "cwd", "cursor" },
  },

  nvdash = {
    load_on_startup = true,

    header = {
      -- "           ▄ ▄                   ",
      -- "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      -- "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      -- "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      -- "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      -- "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      -- "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      -- "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      -- "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
      "                                                                     ",
      "                                                                   ",
      "      ████ ██████           █████      ██                    ",
      "     ███████████             █████                            ",
      "     █████████ ███████████████████ ███   ███████████  ",
      "    █████████  ███    █████████████ █████ ██████████████  ",
      "   █████████ ██████████ █████████ █████ █████ ████ █████  ",
      " ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
      "██████  █████████████████████ ████ █████ █████ ████ ██████",
      "                                                                     ",
    },

    buttons = {
      {
        "󰁯  Restore Session",
        "Spc q l",
        function()
          require("persistence").load { last = true }
        end,
      },
      {
        "  Zoxide",
        "Spc z x",
        ":lua require('telescope').extensions.zoxide.list()",
      },
      {
        "  Find File",
        "Spc f",
        "Telescope find_files",
      },
      {
        "󰈚  Recent Files",
        "Spc s o",
        "Telescope oldfiles",
      },
      {
        "  Bookmarks",
        "Spc s m",
        "Telescope marks",
      },
    },
  },

  lsp = {
    -- show function signatures i.e args as you type
    signature = true,
    semantic_tokens = false,
  },

  term = {
    -- hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.3, vsp = 0.2 },
    float = {
      relative = "editor",
      row = 0.1,
      col = 0.1,
      width = 0.8,
      height = 0.7,
      border = "single",
    },
  },

  hl_add = {
    FoldColumnLine = { fg = "grey", bg = "black" },
    FoldColumnSymbol = { fg = "grey_fg", bg = "black" },
    CursorLineFold = { fg = { "blue", 2 }, bg = "black" },
    DiagnosticError = { fg = "red", bg = "black" },
    DiagnosticWarn = { fg = "orange", bg = "black" },
    DiagnosticInfo = { fg = "blue", bg = "black" },
    DiagnosticHint = { fg = "green", bg = "black" },
    Identifier = { fg = "purple", bg = "black" },
  },

  hl_override = {
    FoldColumn = { fg = "grey", bg = "black" },
    Folded = {
      fg = "light_grey",
      bg = "black2",
    },
    NvDashAscii = {
      fg = "blue",
      bg = "black",
    },

    NvDashButtons = {
      fg = "white",
      bg = "black",
    },
  },
}

return M
