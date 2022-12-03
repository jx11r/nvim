local success, packer = pcall(require, 'packer')
local g = vim.g

-- Check if packer hasn't been installed yet
if not success then
  return
end

-- User Plugins
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  if g.packer_bootstrap then
    packer.sync()
  end
end)
