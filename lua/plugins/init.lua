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
    config = { default = true },
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
    config = {
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
    config = {
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
    'yamatsum/nvim-cursorline',
    event = 'VeryLazy',
    config = {
      cursorword = { enable = false },
      cursorline = {
        enable = true,
        number = true,
        timeout = 500,
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = {
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
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function()
      require('notify').setup { timeout = 3000 }
      vim.notify = require 'notify'
    end,
  },
}
