local M = {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
}

M.opts = {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      'alpha',
      'lazy',
      'mason',
      'TelescopePrompt',
    },
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        icons_enabled = false,
      },
      {
        'filetype',
        icons_enabled = false,
      },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}

return M
