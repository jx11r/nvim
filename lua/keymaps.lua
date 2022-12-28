local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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
map('n', '<C-c>', ':ColorizerToggle<cr>', opts)

-- Tab Line
map('n', '<Tab>', ':BufferLineCycleNext<cr>', opts)
map('n', '<C-Tab>', ':BufferLineCyclePrev<cr>', opts)
map('n', '<C-w>', ':bdelete!<cr>', opts)

-- File Explorer
map('n', '<Space>e', ':NvimTreeToggle<cr>', opts)

-- Fuzzy Finder
map('n', '<Space>f', ':Telescope find_files<cr>', opts)
map('n', '<Space>g', ':Telescope live_grep<cr>', opts)

-- Go to any word in the current buffer
map('n', '<Space>s', ':HopWord<cr>', opts)
