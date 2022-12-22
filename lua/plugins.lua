local success, packer = pcall(require, 'packer')
local g = vim.g

-- Check if packer hasn't been installed yet
if not success then
  return
end

-- Popup Window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float {
        border = 'rounded',
      }
    end,
  },
}

-- User Plugins
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  -- use 'dstein64/vim-startuptime'

  -- Colorscheme
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = [[ require 'config.catppuccin' ]],
  }

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    after = 'catppuccin',
    config = [[ require 'config.lualine' ]],
  }

  -- Tab Line
  use {
    'akinsho/bufferline.nvim',
    after = 'catppuccin',
    event = 'BufRead',
    config = [[ require 'config.bufferline' ]],
  }

  -- Icons
  use {
    'nvim-tree/nvim-web-devicons',
    after = 'lualine.nvim',
  }

  -- Syntax Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update()
    end,
    config = [[ require 'config.treesitter' ]],
  }

  -- Color Highlighter
  use {
    'NvChad/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = function()
      require('colorizer').setup()
    end,
  }

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeFocus',
    config = [[ require 'config.tree' ]],
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    config = function()
      require('telescope').setup()
    end,
  }

  -- Git Integration
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- Completion
  use {
    'rafamadriz/friendly-snippets',
    event = 'InsertEnter',
    module = 'cmp',
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    requires = {
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    },
    config = [[ require 'config.cmp' ]],
  }

  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  }

  -- Editing Support
  use {
    'lukas-reineke/indent-blankline.nvim',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('indent_blankline').setup { char = '┆' }
    end,
  }

  use {
    'numToStr/Comment.nvim',
    keys = { 'gc', 'gb' },
    config = function()
      require('Comment').setup()
    end,
  }

  use {
    'phaazon/hop.nvim',
    cmd = 'HopWord',
    config = function()
      require('hop').setup()
    end,
  }

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }

  if g.packer_bootstrap then
    packer.sync()
  end
end)
