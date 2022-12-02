local keymap = vim.keymap

-- Reload
keymap.set('n', '<Space>r', ':source $MYVIMRC<cr>')

-- Save & Quit
keymap.set('n', '<Space>w', ':w<cr>')
keymap.set('n', '<Space>q', ':q!')

-- Select All
keymap.set('n', '<C-a>', 'gg<S-v>G')
