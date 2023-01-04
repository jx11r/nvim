local M = {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'BufReadPre',
}

function M.config()
  local formatting = require('null-ls').builtins.formatting
  local diagnostics = require('null-ls').builtins.diagnostics

  require('null-ls').setup {
    sources = {
      -- [ lua ]
      formatting.stylua,

      -- [ python ]
      -- https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes
      diagnostics.ruff.with { extra_args = { '--extend-ignore=E501' } },
      diagnostics.mypy,
      formatting.black,
    },
  }
end

return M
