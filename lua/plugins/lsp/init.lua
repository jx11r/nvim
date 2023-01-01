local M = {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
}

function M.config()
  require 'mason'
  require('plugins.lsp.ui').setup()

  local function on_attach(client, bufnr)
    require('plugins.lsp.formatting').setup(client, bufnr)
    require('plugins.lsp.mapping').setup(client, bufnr)
  end

  local servers = {
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

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend('force', {}, options, opts or {})
    require('lspconfig')[server].setup(opts)
  end
end

return M
