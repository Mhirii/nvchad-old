local on_attach = require("plugins.configs.lspconfig").on_attach
local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local filter = function(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local filterReactDTS = function(value)
  if value.uri then
    return string.match(value.uri, "%.d.ts") == nil
  elseif value.targetUri then
    return string.match(value.targetUri, "%.d.ts") == nil
  end
end

local handlers = {
  ["textDocument/definition"] = function(err, result, method, ...)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return baseDefinitionHandler(err, filtered_result, method, ...)
    end

    baseDefinitionHandler(err, result, method, ...)
  end,
  ["textDocument/foldingRange"] = function(err, result, ctx, config)
    if not err and result then
      for _, r in pairs(result) do
        if r.startLine == r.endLine then
          r.kind = "region"
        end
      end
    end
    vim.lsp.handlers["textDocument/foldingRange"](err, result, ctx, config)
  end,
}

return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  config = function()
    require("typescript-tools").setup {
      on_attach = on_attach,
      -- handlers = handlers,
      -- ...
      settings = {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = "insert_leave",
        -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
        -- "remove_unused_imports"|"organize_imports") -- or string "all"
        -- to include all supported code actions
        -- specify commands exposed as code_actions
        expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
        -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
        -- not exists then standard path resolution strategy is applied
        tsserver_path = nil,
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
        -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
        -- memory limit in megabytes or "auto"(basically no limit)
        tsserver_max_memory = "auto",
        -- described below
        tsserver_format_options = {},
        tsserver_file_preferences = {
          includeCompletionsForModuleExports = true,
          quotePreference = "auto",
          includeCompletionsForImportStatements = true,
          includeAutomaticOptionalChainCompletions = true,
          includeCompletionsWithClassMemberSnippets = true,
          includeCompletionsWithObjectLiteralMethodSnippets = true,
          importModuleSpecifierPreference = "shortest",
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        -- locale of all tsserver messages, supported locales you can find here:
        -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
        tsserver_locale = "en",
        -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
        complete_function_calls = true,
        include_completions_with_insert_text = true,
        -- CodeLens
        -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
        -- possible values: ("off"|"all"|"implementations_only"|"references_only")
        code_lens = "off",
        -- by default code lenses are displayed on all referenceable values and for some of you it can
        -- be too much this option reduce count of them by removing member references from lenses
        disable_member_code_lens = true,
        -- JSXCloseTag
        -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
        -- that maybe have a conflict if enable this feature. )
        jsx_close_tag = {
          enable = false,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    }
  end,
}
