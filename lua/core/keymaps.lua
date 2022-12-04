local keymap = vim.keymap

-- Reload init.lua
keymap.set('n', '<Space>r', ':source $MYVIMRC<cr>')

-- Write / Quit
keymap.set('n', '<Space>w', ':w<cr>')
keymap.set('n', '<Space>q', ':q<cr>')

-- Select All
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Color Highlighter
keymap.set('n', '<C-c>', ':ColorizerToggle<cr>')

-- File Explorer
keymap.set('n', '<Space>e', ':NvimTreeFocus<cr>')
