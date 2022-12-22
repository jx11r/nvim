local map = vim.keymap.set

-- Reload init.lua
map('n', '<Space>r', ':source $MYVIMRC<cr>')

-- Write / Quit
map('n', '<Space>w', ':w<cr>')
map('n', '<Space>q', ':q<cr>')

-- Select All
map('n', '<C-a>', 'gg<S-v>G')

-- Packer Stuff
map('n', '<Space>pc', ':PackerCompile<cr>')
map('n', '<Space>pi', ':PackerInstall<cr>')
map('n', '<Space>ps', ':PackerSync<cr>')

-- Color Highlighter
map('n', '<C-c>', ':ColorizerToggle<cr>')

-- Tab Line
map('n', '<Tab>', ':BufferLineCycleNext<cr>')
map('n', '<C-Tab>', ':BufferLineCyclePrev<cr>')
map('n', '<C-w>', ':bdelete!<cr>')

-- File Explorer
map('n', '<Space>e', ':NvimTreeFocus<cr>')

-- Fuzzy Finder
map('n', '<Space>f', ':Telescope find_files<cr>')
map('n', '<Space>g', ':Telescope live_grep<cr>')

-- Go to any word in the current buffer
map('n', '<Space>s', ':HopWord<cr>')