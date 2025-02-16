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
