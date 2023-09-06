local M = {
  'akinsho/nvim-bufferline.lua',
  event = 'BufAdd',
}

function M.opts()
  local mocha = require('catppuccin.palettes').get_palette 'mocha'
  return {
    options = {
      always_show_bufferline = false,
      indicator = { style = 'none' },
      name_formatter = function(buf)
        return ' ' .. buf.name .. ' '
      end,
      max_name_length = 20,
      separator_style = { nil, nil },
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = false,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
          separator = false,
        },
      },
    },

    highlights = require('catppuccin.groups.integrations.bufferline').get {
      custom = {
        mocha = {
          fill = { bg = mocha.mantle },
          indicator_visible = { bg = mocha.mantle },
        },
      },
    },
  }
end

return M
