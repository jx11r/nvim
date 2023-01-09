local M = {}
local map = vim.keymap.set

function M.setup(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'q', vim.diagnostic.open_float, opts)
  map('n', '[d', vim.diagnostic.goto_prev, opts)
  map('n', ']d', vim.diagnostic.goto_next, opts)
  map('n', '<C-d>', vim.diagnostic.setloclist, opts)
  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  map('n', '<leader>t', vim.lsp.buf.type_definition, opts)
  map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  map({ 'i', 'n' }, '<C-f>', vim.lsp.buf.format, opts)
end

return M
