return {
  'nvim-lua/plenary.nvim',

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    opts = { default = true },
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    opts = {
      defaults = {
        entry_prefix = '  ',
        prompt_prefix = '   ',
        selection_caret = '  ',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
        },
      },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {
      current_line_blame = false,
      current_line_blame_formatter = ' <author>, <author_time:%y.%m.%d> · <summary>',
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 500,
      },
    },
  },

  {
    'jx11r/cursorline.nvim',
    event = 'VeryLazy',
    opts = {
      auto_hide = true,
      timeout = 500,
      disabled_filetypes = {
        'alpha',
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    opts = {
      char = '┆',
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
    },
  },

  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = true,
  },

  {
    'kevinhwang91/nvim-hlslens',
    event = 'VeryLazy',
    config = true,
  },

  {
    'numToStr/Comment.nvim',
    keys = { 'gc', 'gb' },
    config = true,
  },

  {
    'phaazon/hop.nvim',
    cmd = 'HopWord',
    config = true,
  },

  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = true,
  },

  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    opts = {
      relative_width = true,
      width = 35,
    },
  },

  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    opts = function()
      local mocha = require('catppuccin.palettes').get_palette 'mocha'
      vim.notify = require 'notify'

      return {
        background_colour = mocha.base;
        timeout = 3000,
      }
    end,
  },
}
