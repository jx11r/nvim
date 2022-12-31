local success, lsp = pcall(require, 'lspconfig')

if not success then
  return
end

local map = vim.keymap.set
local options = { noremap = true, silent = true }

-- Mappings
map('n', 'q', vim.diagnostic.open_float, options)
map('n', '[d', vim.diagnostic.goto_prev, options)
map('n', ']d', vim.diagnostic.goto_next, options)
map('n', '<C-d>', vim.diagnostic.setloclist, options)

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Mappings
  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  map('n', '<Space>t', vim.lsp.buf.type_definition, opts)
  map('n', '<Space>rn', vim.lsp.buf.rename, opts)
  map('n', '<Space>ca', vim.lsp.buf.code_action, opts)

  -- Document Formatting
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
