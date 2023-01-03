-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
  clangd = {},
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  },
}
