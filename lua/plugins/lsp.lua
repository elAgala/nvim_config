return {
  -- First configuration block
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Existing server configurations
        pyright = {},
        -- Updated Volar config (Vue)
        volar = {
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        vtsls = {},
        -- Existing tsserver configuration
        tsserver = {
          filetypes = {},
        },
      },
    },
  },
  -- Second configuration block (TypeScript setup)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    opts = {
      servers = {
        tsserver = {
          filetypes = {},
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Add the vtsls setup here
        vtsls = function(_, opts)
          table.insert(opts.filetypes, "vue")
          LazyVim.extend(opts, "settings.vtsls.tsserver.globalPlugins", {
            {
              name = "@vue/typescript-plugin",
              location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
              languages = { "vue" },
              configNamespace = "typescript",
              enableForWorkspaceTypeScriptVersions = true,
            },
          })
        end,
      },
    },
  },
}