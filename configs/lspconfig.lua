local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "cssls", "clangd", "rust_analyzer", "cmake", "volar", "tsserver" }

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
    filetypes = { "vue" },
    -- If you want to use Volar's Take Over Mode (if you know, you know)
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
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

--
-- lspconfig.pyright.setup { blabla}
