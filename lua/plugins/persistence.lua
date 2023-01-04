return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  config = {
    dir = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/'),
    options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
  },

  keys = {
    {
      'sr',
      function()
        require('persistence').load()
      end,
    },
    {
      'sl',
      function()
        require('persistence').load { last = true }
      end,
    },
    {
      'sd',
      function()
        require('persistence').stop()
      end,
    },
  },
}
