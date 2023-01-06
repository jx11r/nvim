local env = vim.env
local fn = vim.fn
local path = fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- add mason's bin location to path
env.PATH = env.PATH .. ':' .. fn.stdpath 'data' .. '/mason/bin'

-- automatically install lazy.nvim
if not vim.loop.fs_stat(path) then
  print 'Installing plugins...'
  fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    path,
  }
  vim.g.lazy_bootstrap = true
end
vim.opt.rtp:prepend(path)

require('lazy').setup('plugins', {
  lockfile = fn.stdpath 'config' .. '/.lock.json',
  dev = { path = '~/git' },
  ui = { border = 'rounded' },
  change_detection = { notify = false },

  defaults = {
    lazy = true,
    -- version = '*',
  },

  install = {
    colorscheme = {
      'catppuccin',
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
