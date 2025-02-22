return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          cmd = { "dart", "language-server" },
          filetypes = { "dart" },
          settings = {
            dart = {
              completeFunctionCalls = true,
            },
          },
          autostart = true,
        },
      },
    },
  },
}
