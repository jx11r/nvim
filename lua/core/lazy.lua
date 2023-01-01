local fn = vim.fn
local path = fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- automatically install lazy.nvim
if not vim.loop.fs_stat(path) then
  print 'Installing lazy.nvim...'
  vim.g.lazy_bootstrap = true
  fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    path,
  }
end
vim.opt.rtp:prepend(path)

require('lazy').setup('plugins', {
  lockfile = fn.stdpath 'config' .. '/.lock.json',
  ui = { border = 'rounded' },

  defaults = {
    lazy = true,
    -- version = '*',
  },

  install = {
    colorscheme = {
      'catppuccin',
      'habamax',
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'man',
        'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'remote_plugins',
        'shada_plugin',
        'spellfile_plugin',
        'tarPlugin',
        '2html_plugin',
        'tutor_mode_plugin',
        'zipPlugin',
      },
    },
  },
})
