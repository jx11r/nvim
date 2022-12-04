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
    config = function()
      require 'plugin.catppuccin'
    end,
  }

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    after = 'catppuccin',
    config = function()
      require 'plugin.lualine'
    end,
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
    config = function()
      require 'plugin.treesitter'
    end,
  }

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
    config = function()
      require 'plugin.tree'
    end,
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
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- Completion
  use {
    'rafamadriz/friendly-snippets',
    module = 'cmp',
    event = 'InsertEnter',
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function()
      require 'plugin.cmp'
    end,
  }

  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  }

  use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
  use { 'hrsh7th/cmp-buffer', after = 'cmp_luasnip' }
  use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }

  -- Editing Support
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
    config = function()
      require('nvim-autopairs').setup()
    end,
  }

  use {
    'yamatsum/nvim-cursorline',
    config = function()
      require('nvim-cursorline').setup {
        cursorword = { enable = false },
      }
    end,
  }

  if g.packer_bootstrap then
    packer.sync()
  end
end)
