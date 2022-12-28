local success, lspconfig = pcall(require, 'lspconfig')

if not success then
  return
end

local map = vim.keymap.set
local lsp = vim.lsp

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', lsp.buf.declaration, opts)
  map('n', 'gd', lsp.buf.declaration, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },

      workspace = {
        -- library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
}
