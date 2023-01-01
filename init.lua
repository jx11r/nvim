require 'core.options'
require 'core.lazy'

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require 'core.autocmds'
    require 'core.keymaps'
  end,
})
