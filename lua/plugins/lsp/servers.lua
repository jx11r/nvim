-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
  -- clangd = {},

  lua_ls = {
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

  -- ruff_lsp = {
  --   init_options = {
  --     settings = {
  --       -- https://beta.ruff.rs/docs/rules
  --       args = { '--extend-ignore=E501' },
  --     },
  --   },
  -- },
}
