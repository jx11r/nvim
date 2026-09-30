return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {
      style = "night",
      on_highlights = function(hl, colors)
        hl.AlphaHeader = { fg = colors.blue5 }
        hl.AlphaButton = { fg = colors.green1 }
        hl.AlphaShortcut = { fg = colors.orange }
        hl.AlphaFooter = { fg = colors.blue7, italic = true }
      end,
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local keymaps",
      },
    },
    opts = { delay = 500 },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
      },
    },
    opts = {
      modes = {
        search = { enabled = true },
        char = { enabled = false },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = { view = "cmdline" },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "stevearc/oil.nvim",
    opts = {
      watch_for_changes = true,
      view_options = { show_hidden = true },
      float = {
        max_width = 0.8,
        max_height = 0.8,
        border = "rounded",
      },
    },
  },

  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("ibl").setup(opts)
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
    end,
    opts = {
      indent = { char = "┆" },
      scope = { enabled = false },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = { current_line_blame = true },
  },

  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPre", "BufNewFile" },
    opts = { enable_tailwind = true },
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    version = "*",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true },
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
