local M = {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'BufReadPre',
}

function M.opts()
  local formatting = require('null-ls').builtins.formatting
  local diagnostics = require('null-ls').builtins.diagnostics
  return {
    sources = {
      -- [ lua ]
      formatting.stylua,

      -- [ python ]
      diagnostics.mypy,
      formatting.black,
    },
  }
end

return M
