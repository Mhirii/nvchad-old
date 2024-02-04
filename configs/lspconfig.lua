---@diagnostic disable: undefined-global
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end

  if client.supports_method "textDocument/codeLens" then
    require("virtualtypes").on_attach(client, bufnr)
  end
end

local servers = {
  "cssls",
  "clangd",
  "volar",
  "prismals",
  "gopls",
  "emmet_ls",
  "grammarly",
  "yamlls",
  "jsonls",
  "dockerls",
  "lua_ls",
}
--"rust_analyzer", "tsserver"

require("mason-lspconfig").setup {
  ensure_installed = servers,
}

require("mason-lspconfig").setup_handlers {

  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  --disabled
  ["tsserver"] = function() end,

  ["lua_ls"] = function()
    lspconfig["lua_ls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "use", "vim" },
          },
          hint = {
            enable = true,
            setType = true,
          },
          telemetry = {
            enable = false,
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
  end,

  ["gopls"] = function()
    lspconfig["gopls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "go", "gomod", "gowork", "gosum", "goimpl" },
      settings = {
        gopls = {
          buildFlags = { "-tags=wireinject" },
          usePlaceholders = true,
          completeUnimported = true,
          vulncheck = "Imports",
          gofumpt = true,
          staticcheck = true,
          analyses = {
            nilness = true,
            shadow = true,
            unusedparams = true,
            unusewrites = true,
            fieldalignment = true,
            useany = true,
          },
          codelenses = {
            references = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            regenerate_cgo = true,
            generate = true,
            gc_details = false,
            run_govulncheck = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
    }
  end,

  ["eslint"] = function()
    lspconfig["eslint"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
        "astro",
      },
      cmd = { "vscode-eslint-language-server", "--stdio" },
      handlers = {
        ["eslint/confirmESLintExecution"] = function(_, result)
          if not result then
            return
          end
          return 4 -- approved
        end,
        ["eslint/noLibrary"] = function()
          vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
          return {}
        end,
        ["eslint/openDoc"] = function(_, result)
          if not result then
            return
          end
          local sysname = vim.loop.os_uname().sysname
          if sysname:match "Windows_NT" then
            os.execute(string.format("start %q", result.url))
          elseif sysname:match "Linux" then
            os.execute(string.format("xdg-open %q", result.url))
          else
            os.execute(string.format("open %q", result.url))
          end
          return {}
        end,
        ["eslint/probeFailed"] = function()
          vim.notify("[lspconfig] ESLint probe failed.", vim.log.levels.WARN)
          return {}
        end,
      },
      root_dir = require("lspconfig").util.root_pattern(
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "package.json"
      ),
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine",
          },
          showDocumentation = {
            enable = true,
          },
        },
        codeActionOnSave = {
          enable = false,
          mode = "all",
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
          mode = "location",
        },
      },
    }
  end,

  ["tailwindcss"] = function()
    lspconfig["tailwindcss"].setup {
      filetypes = {
        "aspnetcorerazor",
        "astro",
        "astro-markdown",
        "blade",
        "clojure",
        "django-html",
        "htmldjango",
        "edge",
        "eelixir",
        "elixir",
        "ejs",
        "erb",
        "eruby",
        "gohtml",
        "gohtmltmpl",
        "haml",
        "handlebars",
        "hbs",
        "html",
        "html-eex",
        "heex",
        "jade",
        "leaf",
        "liquid",
        "markdown",
        "mdx",
        "mustache",
        "njk",
        "nunjucks",
        "php",
        "razor",
        "slim",
        "twig",
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "stylus",
        "sugarss",
        "javascriptreact",
        "reason",
        "rescript",
        "typescriptreact",
        "vue",
        "svelte",
      },
    }
  end,
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  lspconfig["volar"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    filetypes = { "vue" },
  }
end

local volar_cmd = { "vue-language-server", "--stdio" }
local volar_root_dir = lspconfig.util.root_pattern "package.json"

local tsdk = "node_modules/typescript/lib"
local function on_new_config(new_config, workspace_dir)
  new_config.init_options.typescript.serverPath = tsdk
  new_config.init_options.typescript.tsdk = tsdk
end

lspconfig.volar = {

  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,
    filetypes = { "vue", "typescript", "javascript" },
    -- If you want to use Volar's Take Over Mode (if you know, you know)
    -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    init_options = {
      typescript = {
        tsdk = tsdk,
      },
      languageFeatures = {
        implementation = true, -- new in @volar/vue-language-server v0.33
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        renameFileRefactoring = true,
        signatureHelp = true,
        codeAction = true,
        workspaceSymbol = true,
        completion = {
          defaultTagNameCase = "both",
          defaultAttrNameCase = "kebabCase",
          getDocumentNameCasesRequest = false,
          getDocumentSelectionRequest = false,
        },
        -- doc
        documentHighlight = true,
        documentLink = true,
        codeLens = { showReferencesNotification = true },
        -- not supported - https://github.com/neovim/neovim/pull/15723
        semanticTokens = false,
        diagnostics = true,
        schemaRequestService = true,
      },
      -- html
      documentFeatures = {
        selectionRange = true,
        foldingRange = true,
        linkedEditingRange = true,
        documentSymbol = true,
        -- not supported - https://github.com/neovim/neovim/pull/13654
        documentColor = false,
        documentFormatting = {
          defaultPrintWidth = 100,
        },
      },
    },
  },
}

vim.lsp.handlers["textDocument/hover"] = require("noice").hover
vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature

-- If the buffer has been edited before formatting has completed, do not try to apply the changes
vim.lsp.handlers["textDocument/formatting"] = function(err, result, ctx, _)
  if err ~= nil or result == nil then
    return
  end

  -- If the buffer hasn't been modified before the formatting has finished, update the buffer
  if not vim.api.nvim_buf_get_option(ctx.bufnr, "modified") then
    local view = vim.fn.winsaveview()
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    vim.lsp.util.apply_text_edits(result, ctx.bufnr, client.offset_encoding)
    vim.fn.winrestview(view)
    if ctx.bufnr == vim.api.nvim_get_current_buf() or not ctx.bufnr then
      vim.api.nvim_command "noautocmd :update"
    end
  end
end

vim.diagnostic.config {
  virtual_lines = false,
  virtual_text = {
    source = "always",
    prefix = "■",
  },
  -- virtual_text = false,
  float = {
    source = "always",
    border = "rounded",
    format = function(diagnostic)
      if diagnostic.source == "" then
        return diagnostic.message
      end
      if diagnostic.source == "eslint" then
        return string.format(
          "%s [%s]",
          diagnostic.message,
          -- shows the name of the rule
          diagnostic.user_data.lsp.code
        )
      end
      return string.format("%s [%s]", diagnostic.message, diagnostic.source)
    end,
    suffix = function()
      return ""
    end,
    severity_sort = true,
    close_events = { "CursorMoved", "InsertEnter" },
  },
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
}
