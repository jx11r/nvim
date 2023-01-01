local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- write / quit
map('n', '<leader>w', ':w<cr>')
map('n', '<leader>q', ':q<cr>')

-- select all
map('n', '<C-a>', 'gg<S-v>G')

-- delete a word backwards
map('n', 'dw', 'vb"_d')

-- split window
map('n', 'ss', '<C-w>v')
map('n', 'sw', '<C-w>s')

-- switch between windows
map('n', '<A-left>', '<C-w>h')
map('n', '<A-right>', '<C-w>l')
map('n', '<A-up>', '<C-w>k')
map('n', '<A-down>', '<C-w>j')

-- resize window
map('n', '<S-left>', '<C-w>>')
map('n', '<S-right>', '<C-w><')
map('n', '<S-up>', '<C-w>+')
map('n', '<S-down>', '<C-w>-')

-- tab line
map('n', '<Tab>', ':BufferLineCycleNext<cr>', opts)
map('n', '<C-Tab>', ':BufferLineCyclePrev<cr>', opts)
map('n', '<C-w>', ':bdelete!<cr>', opts)

-- file explorer
map('n', '<leader>e', ':NvimTreeToggle<cr>', opts)

-- fuzzy finder
map('n', '<leader>f', ':Telescope find_files<cr>', opts)
map('n', '<leader>g', ':Telescope live_grep<cr>', opts)

-- git integration
map('n', 'tb', ':Gitsigns toggle_current_line_blame<cr>', opts)

-- go to any word in the current buffer
map('n', '<Space>s', ':HopWord<cr>', opts)
