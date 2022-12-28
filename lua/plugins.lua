local success, packer = pcall(require, 'packer')
local g = vim.g

-- Check if packer hasn't been installed yet
if not success then
  return
end

-- Automatically compile packer whenever plugins.lua is updated
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- Custom packer initialization
packer.init {
  auto_reload_compiled = true,
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
  use 'dstein64/vim-startuptime'

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
    event = 'BufRead',
    config = [[ require 'config.treesitter' ]],
  }

  -- Color Highlighter
  use {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    config = [[ require 'config.colorizer' ]],
  }

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeFocus', 'NvimTreeToggle' },
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

  -- LSP
  use {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    module = 'mason-lspconfig',
    config = [[ require 'config.mason' ]],
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    cmd = { 'LspInstall', 'LspUninstall' },
    module = 'mason',
    config = function()
      require('mason-lspconfig').setup()
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    config = [[ require 'config.lsp' ]],
  }

  -- Completion
  use {
    'rafamadriz/friendly-snippets',
    event = 'InsertEnter',
    requires = {
      {
        'L3MON4D3/LuaSnip',
        after = 'friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
    },
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    requires = {
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = [[ require 'config.cmp' ]],
  }

  -- Editing Support
  use {
    'lukas-reineke/indent-blankline.nvim',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('indent_blankline').setup {
        char = '┆',
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
      }
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

  -- Automatically set up the configuration after cloning packer
  if g.packer_bootstrap then
    packer.sync()
  end
end)
