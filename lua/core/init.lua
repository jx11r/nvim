local g = vim.g

-- Disable optional providers
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Disable vim builtins for faster startup time
local built_ins = {
  'gzip',
  'tar',
  'tarPlugin',
  'zip',
  'zipPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  'matchit',
  'matchparen',
  '2html_plugin',
  'logiPat',
  'rrhelper',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
}

for _, plugin in pairs(built_ins) do
  g['loaded_' .. plugin] = 1
end

-- Load core modules
require 'core.options'
require 'core.keymaps'
require 'core.packer'
