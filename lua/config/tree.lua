require('nvim-tree').setup {
  auto_reload_on_write = true,
  hijack_cursor = true,
  sort_by = 'name',
  sync_root_with_cwd = true,
  filesystem_watchers = { enable = true },

  git = {
    enable = false,
    ignore = false,
  },

  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  view = {
    hide_root_folder = true,
    signcolumn = 'yes',
    width = math.floor(vim.o.columns / 5),
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

  renderer = {
    group_empty = true,
    highlight_opened_files = 'none',
    indent_width = 1,
    icons = {
      show = {
        folder = true,
      },
    },
  },
}
