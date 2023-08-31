local M = {
  'neovim/nvim-lspconfig',
  enabled = false,
  event = 'BufReadPre',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  servers = require 'plugins.lsp.servers',
}

M.opts = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    require('plugins.lsp.formatting').setup(client, bufnr)
    require('plugins.lsp.keymaps').setup(client, bufnr)
  end,
}

function M.config(self, opts)
  require('plugins.lsp.ui').setup()
  for server, options in pairs(self.servers) do
    options = vim.tbl_deep_extend('force', options, opts)
    require('lspconfig')[server].setup(options)
  end
end

return M
