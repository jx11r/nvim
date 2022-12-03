local success, packer = pcall(require, 'packer')
local g = vim.g

-- Check if packer hasn't been installed yet
if not success then
  return
end

-- User Plugins
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  -- use 'dstein64/vim-startuptime'

  -- Color Scheme
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      if pcall(require, 'catppuccin') then
        vim.cmd [[ colorscheme catppuccin ]]
      end
    end,
  }

  if g.packer_bootstrap then
    packer.sync()
  end
end)
