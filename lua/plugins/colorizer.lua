return {
  'NvChad/nvim-colorizer.lua',
  event = 'BufReadPre',
  config = {
    filetypes = {
      '*',
      '!lazy',
      '!mason',
    },

    buftypes = {
      '*',
      '!prompt',
      '!popup',
    },

    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css_fn = true,
    },
  },
}
