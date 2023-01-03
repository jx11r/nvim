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
