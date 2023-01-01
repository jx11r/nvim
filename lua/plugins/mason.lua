local M = {
  'williamboman/mason.nvim',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
}

function M.config()
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

  require('mason-lspconfig').setup {
    automatic_installation = false,
  }

  -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
  local servers = {
    'clangd',
    'sumneko_lua',
  }

  -- automatically install lsp servers at lazy bootstrapping
  if vim.g.lazy_bootstrap then
    vim.cmd('bw | silent! LspInstall ' .. table.concat(servers, ' '))
  end
end

return M
