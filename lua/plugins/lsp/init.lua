local M = {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
}

function M.config()
  local servers = require 'plugins.lsp.servers'
  require('plugins.lsp.ui').setup()

  local function on_attach(client, bufnr)
    require('plugins.lsp.keymaps').setup(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  local options = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend('force', opts, options)
    require('lspconfig')[server].setup(opts)
  end
end

return M
