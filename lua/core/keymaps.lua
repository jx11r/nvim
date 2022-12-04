local keymap = vim.keymap

-- Reload init.lua
keymap.set('n', '<Space>r', ':source $MYVIMRC<cr>')

-- Write / Quit
keymap.set('n', '<Space>w', ':w<cr>')
keymap.set('n', '<Space>q', ':q<cr>')

-- Select All
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Packer Stuff
keymap.set('n', '<Space>pc', ':PackerCompile<cr>')
keymap.set('n', '<Space>pi', ':PackerInstall<cr>')
keymap.set('n', '<Space>ps', ':PackerSync<cr>')

-- Color Highlighter
keymap.set('n', '<C-c>', ':ColorizerToggle<cr>')

-- File Explorer
keymap.set('n', '<Space>e', ':NvimTreeFocus<cr>')

-- Fuzzy Finder
keymap.set('n', '<Space>t', ':Telescope find_files<cr>')

-- Go to any word in the current buffer
keymap.set('n', '<Space>f', ':HopWord<cr>')
