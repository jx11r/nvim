if pcall(require, 'impatient') then
  require 'impatient'
end

local g = vim.g
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

-- Disable built-in vim plugins
for _, plugin in ipairs {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'netrwPlugin',
  'remote_plugins',
  'shada_plugin',
  'tarPlugin',
  '2html_plugin',
  'tutor_mode_plugin',
  'zipPlugin',
} do
  g['loaded_' .. plugin] = 1
end

-- Disable optional providers
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Load modules
require 'options'
require 'keymaps'
require 'plugins'
