local M = {
  'williamboman/mason.nvim',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
}

function M.ensure_installed(pkgs)
  local mr = require 'mason-registry'
  for _, pkg in ipairs(pkgs) do
    local p = mr.get_package(pkg)
    if not p:is_installed() then
      p:install()
    end
  end
end

function M.config()
  require('mason').setup {
    PATH = 'skip',
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
  require('mason-lspconfig').setup {
    ensure_installed = {
      'clangd',
      'sumneko_lua',
    },
  }

  -- install tools automatically
  M.ensure_installed {
    'stylua',
  }

  if vim.g.lazy_bootstrap then
    vim.cmd [[ bw | silent! Mason ]]
  end
end

return M
