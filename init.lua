require 'options'
require 'init'

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require 'autocmds'
    require 'keymaps'
  end,
})
