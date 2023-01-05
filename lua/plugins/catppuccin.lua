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
      symbols_outline = true,
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
          NvimTreeRootFolder = { fg = mocha.mantle },
          NvimTreeWinSeparator = { bg = 'none' },
        }
      end,
    },

    custom_highlights = function(color)
      return {
        AlphaHeader = { fg = color.blue },
        AlphaButton = { fg = color.pink },
        AlphaShortcut = { fg = color.red },
        AlphaFooter = { fg = color.surface1, style = { 'italic' } },
      }
    end,
  }

  vim.cmd [[ colorscheme catppuccin ]]
end

return M
