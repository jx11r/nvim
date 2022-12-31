require('mason').setup {
  PATH = 'skip',
  max_concurrent_installers = 4,

  ui = {
    border = 'rounded',
    check_outdated_packages_on_open = true,
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
local servers = {
  'sumneko_lua',
  -- 'clangd',
}

-- Automatically install LSP servers at packer bootstrap
if vim.g.packer_bootstrap then
  vim.cmd('bw | silent! LspInstall ' .. table.concat(servers, ' '))
end
