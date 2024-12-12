return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = { "vue" },
          init_options = {
            typescript = {
              tsdk = vim.fn.expand(
                "$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib"
              ),
            },
            vue = {
              hybridMode = false,
            },
          },
        },
        vtsls = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
        },
      },
    },
  },
}
-- return {
--   -- LSP Configuration
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         -- Volar configuration for Vue
--         volar = {
--           filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
--           init_options = {
--             vue = {
--               hybridMode = true,
--             },
--             languageFeatures = {
--               implementation = true,
--               references = true,
--               definition = true,
--               typeDefinition = true,
--               callHierarchy = true,
--               hover = true,
--               rename = true,
--               renameFileRefactoring = true,
--               signatureHelp = true,
--               codeAction = true,
--               workspaceSymbol = true,
--               completion = {
--                 defaultTagNameCase = "both",
--                 defaultAttrNameCase = "kebabCase",
--                 getDocumentNameCasesRequest = false,
--                 getDocumentSelectionRequest = false,
--               },
--             },
--           },
--         },
--         -- TSServer configuration
--         tsserver = {
--           filetypes = {
--             "javascript",
--             "javascriptreact",
--             "javascript.jsx",
--             "typescript",
--             "typescriptreact",
--             "typescript.tsx",
--             "vue",
--           },
--         },
--       },
--       setup = {
--         tsserver = function(_, opts)
--           local vue_typescript_plugin = vim.fn.expand(
--             "$HOME/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"
--           )
--           opts.init_options = opts.init_options or {}
--           opts.init_options.plugins = {
--             {
--               name = "@vue/typescript-plugin",
--               location = vue_typescript_plugin,
--               languages = { "javascript", "typescript", "vue" },
--             },
--           }
--         end,
--       },
--     },
--   },
-- }
