local M = {
  'nvim-tree/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
}

M.opts = {
  auto_reload_on_write = true,
  hijack_cursor = true,
  sort_by = 'name',
  sync_root_with_cwd = true,
  filesystem_watchers = { enable = true },

  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = false,
    },
  },

  git = {
    enable = false,
    ignore = false,
  },

  renderer = {
    group_empty = true,
    highlight_opened_files = 'none',
    root_folder_label = ':.:s?.*?/..?',
    indent_width = 2,
    indent_markers = {
      enable = true,
      icons = {
        corner = '└ ',
        edge = '│ ',
        item = '│ ',
        none = '  ',
      },
    },
    icons = {
      show = {
        folder = true,
        folder_arrow = false,
      },
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
      },
    },
  },

  view = {
    adaptive_size = false,
    hide_root_folder = false,
    signcolumn = 'yes',
    width = math.floor(vim.o.columns / 5.5),
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = function()
        local columns = vim.o.columns
        local lines = vim.o.lines
        local width = math.ceil(columns * 0.6 - 4)
        local height = math.ceil(lines * 0.8 - 4)
        return {
          relative = 'editor',
          border = 'rounded',
          width = width,
          height = height,
          col = math.ceil((columns - width) * 0.5),
          row = math.ceil((lines - height) * 0.5 - 1),
        }
      end,
    },
  },
}

return M
