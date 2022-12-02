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
  vim.g['loaded_' .. plugin] = 1
end

-- Load core modules
require('core.options')
require('core.keymaps')
