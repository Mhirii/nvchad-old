return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    event = "VeryLazy",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function(_, opts)
      local chat = require "CopilotChat"
      local prompts = require "CopilotChat.prompts"
      local select = require "CopilotChat.select"

      chat.setup(opts)

      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Inline chat with Copilot
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      -- Restore CopilotChatBuffer
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })

      prompts.Explain = {
        prompt = "/COPILOT_EXPLAIN Write an explanation for the code above as paragraphs of text.",
      }
      prompts.Tests = {
        prompt = "/COPILOT_TESTS Write a set of detailed unit test functions for the code above.",
      }
      prompts.Fix = {
        prompt = "/COPILOT_FIX There is a problem in this code. Rewrite the code to show it with the bug fixed.",
      }
      prompts.Optimize = {
        prompt = "/COPILOT_REFACTOR Optimize the selected code to improve performance and readablilty.",
      }
      prompts.Docs = {
        prompt = "/COPILOT_REFACTOR Write documentation for the selected code. The reply should be a codeblock containing the original code with the documentation added as comments. Use the most appropriate documentation style for the programming language used (e.g. JSDoc for JavaScript, docstrings for Python etc.",
      }
      prompts.FixDiagnostic = {
        prompt = "Please assist with the following diagnostic issue in file:",
        selection = select.diagnostics,
      }
      prompts.Commit = {
        prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        selection = select.gitdiff,
      }
      prompts.CommitStaged = {
        prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        selection = function(source)
          return select.gitdiff(source, true)
        end,
      }

      return {
        debug = false, -- Enable debug logging
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections

        system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
        model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
        temperature = 0.1, -- GPT temperature

        name = "CopilotChat", -- Name to use in chat
        separator = "---", -- Separator to use in chat
        show_folds = true, -- Shows folds for sections in chat
        show_help = true, -- Shows help message as virtual lines when waiting for user input
        auto_follow_cursor = true, -- Auto-follow cursor in chat
        auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

        selection = function(source)
          return select.visual(source) or select.line(source)
        end,

        prompts = prompts,

        window = {
          layout = "vertical", -- 'vertical', 'horizontal', 'float'
          -- Options below only apply to floating windows
          relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
          border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
          width = 0.8, -- fractional width of parent
          height = 0.6, -- fractional height of parent
          row = nil, -- row position of the window, default is centered
          col = nil, -- column position of the window, default is centered
          title = "Copilot Chat", -- title of chat window
          footer = nil, -- footer of chat window
          zindex = 1, -- determines if window is on top or below other floating windows
        },
        mappings = {
          complete = {
            detail = "Use @<Tab> or /<Tab> for options.",
            insert = "<Tab>",
          },
          close = {
            normal = "q",
            insert = "<C-c>",
          },
          reset = {
            normal = "<C-l>",
            insert = "<C-l>",
          },
          submit_prompt = {
            normal = "<CR>",
            insert = "<C-m>",
          },
          accept_diff = {
            normal = "<C-y>",
            insert = "<C-y>",
          },
          show_diff = {
            normal = "gd",
          },
          show_system_prompt = {
            normal = "gp",
          },
          show_user_selection = {
            normal = "gs",
          },
        },
      }
    end,
  },
}
