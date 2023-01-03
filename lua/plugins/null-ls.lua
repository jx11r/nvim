local M = {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'BufReadPre',
}

function M.config()
  local formatting = require('null-ls').builtins.formatting
  local diagnostics = require('null-ls').builtins.diagnostics

  require('null-ls').setup {
    sources = {
      formatting.stylua,
    },
  }
end

return M
