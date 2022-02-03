--==[ Plugins ]==--

return require('packer').startup(function()
    -- Performance
    use 'dstein64/vim-startuptime'

    -- Color Schemes
    use 'marko-cerovac/material.nvim'
    -- use 'Shatur/neovim-ayu'
    -- use 'RRethy/nvim-base16'
    -- use 'folke/tokyonight.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    -- Nvim Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'
end)
