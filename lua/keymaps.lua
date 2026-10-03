local map = vim.keymap.set

-- general
map({ "n", "i", "x" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Exit" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("x", "<", "<gv", { desc = "Indent left" })
map("x", ">", ">gv", { desc = "Indent right" })
map("n", "<leader><leader>", "<cmd>b#<cr>", { desc = "Switch to last buffer" })
map("n", "<C-w>", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })

-- window manipulation
map("n", "<leader>-", "<C-w>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-w>v", { desc = "Split window right" })

map("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

map("n", "<C-left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<C-up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })

-- plugins
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open lazy.nvim" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope: find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope: live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope: buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope: help tags" })
map("n", "-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" })
map("n", "<leader>a", "<cmd>AerialToggle!<cr>", { desc = "View code symbols" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle line blame" })
