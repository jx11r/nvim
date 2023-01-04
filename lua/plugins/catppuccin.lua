local M = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 999,
}

function M.config()
  require('catppuccin').setup {
    flavour = 'mocha',
    transparent_background = false,

    integrations = {
      cmp = true,
      gitsigns = true,
      hop = true,
      notify = true,
      nvimtree = true,
      mason = true,
      telescope = true,
      treesitter = true,
      ts_rainbow = true,
      native_lsp = {
        enabled = true,
      },
    },

    highlight_overrides = {
      mocha = function(mocha)
        return {
          -- nvim-tree
          NvimTreeRootFolder = { fg = mocha.mantle },
          NvimTreeWinSeparator = { bg = 'none' },
        }
      end,
    },
  }

  vim.cmd [[ colorscheme catppuccin ]]
end

return M
