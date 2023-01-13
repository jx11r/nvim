local M = {
  'neovim/nvim-lspconfig',
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

function M.config(self, options)
  require('plugins.lsp.ui').setup()
  for server, opts in pairs(self.servers) do
    opts = vim.tbl_deep_extend('force', opts, options)
    require('lspconfig')[server].setup(opts)
  end
end

return M
