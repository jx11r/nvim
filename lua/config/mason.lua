require('mason').setup {
  PATH = 'skip',
  ui = {
    border = 'rounded',
    keymaps = {
      toggle_package_expand = '<CR>',
      install_package = 'i',
      update_package = 'u',
      check_package_version = 'c',
      update_all_packages = 'U',
      check_outdated_packages = 'C',
      uninstall_package = 'X',
      cancel_installation = '<C-c>',
      apply_language_filter = '<C-f>',
    },
  },
}

-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local lsp_servers = {
  'sumneko_lua',
}

-- Automatically install LSP servers at packer bootstrap
if vim.g.packer_bootstrap then
  vim.cmd('bw | silent! LspInstall ' .. table.concat(lsp_servers, ' '))
end
