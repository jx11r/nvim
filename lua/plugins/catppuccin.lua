local M = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 999,
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd [[ colorscheme catppuccin ]]
  end,
}

M.opts = {
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

return M
