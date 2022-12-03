local fn = vim.fn
local path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

-- Automatically install packer
if fn.empty(fn.glob(path)) > 0 then
  fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    path,
  }
  vim.cmd [[ packadd packer.nvim ]]
  vim.g.packer_bootstrap = true
end
