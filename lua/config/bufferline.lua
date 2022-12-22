require('bufferline').setup {
  options = {
    always_show_bufferline = false,
    indicator = { style = 'icon' },
    name_formatter = function(buf)
      return ' ' .. buf.name .. ' '
    end,
    max_name_length = 20,
    separator_style = 'thin',
    show_buffer_close_icons = true,
    show_close_icon = false,
  },

  highlights = require('catppuccin.groups.integrations.bufferline').get {
    custom = {
      mocha = {
        fill = { bg = '#181825' },
      },
    },
  },
}
