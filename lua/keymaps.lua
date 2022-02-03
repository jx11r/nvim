--==[ Key Bindings ]==--

-- Set new keymap
local map = function(key)
    local opts = {noremap = true}
    for i, v in pairs(key) do
        if type(i) == 'string' then
            opts[i] = v
        end
    end

    vim.api.nvim_set_keymap(
        key[1],
        key[2],
        key[3],
        opts
    )
end

-- Leader Key
vim.g.mapleader = ' '

-- Save & Quit
map{'n', '<leader>w', ':w<cr>'}
map{'n', '<leader>q', ':q<cr>'}

-- Reload
map{'n', '<leader>r', ':source %'}

-- Enable IDE options
map{'n', '<leader>e', ':lua require("ide")<cr>'}

-- Neovim Tree
map{'n', '<C-n>', ':NvimTreeToggle<cr>'}
