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

  local options = {
    on_attach = function(client, bufnr)
      require('plugins.lsp.format').setup(client, bufnr)
      require('plugins.lsp.keymaps').setup(client, bufnr)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend('force', opts, options)
    require('lspconfig')[server].setup(opts)
  end
end

return M
