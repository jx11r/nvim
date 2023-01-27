-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
  -- clangd = {},
  -- jedi_language_server = {},
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
