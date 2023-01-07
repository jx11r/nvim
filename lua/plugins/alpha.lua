local M = {
  'goolord/alpha-nvim',
  event = 'VimEnter',
}

M.ascii = {
  [[                                       ]],
  [[    ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ ]],
  [[     █  █▀   ▀  █   █      █  ██ █ █ █ ]],
  [[ ██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ]],
  [[ █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ]],
  [[ █  █ █ ▀███▀           █  █   ▐    █  ]],
  [[ █   ██                  █▐        ▀   ]],
  [[                         ▐             ]],
  [[                                       ]],
}

function M.config()
  local button = require('alpha.themes.dashboard').button

  local section = {
    header = {
      type = 'text',
      val = M.ascii,
      opts = {
        position = 'center',
        hl = 'AlphaHeader',
      },
    },

    buttons = {
      type = 'group',
      val = {
        button('e', '  New file', ':ene | startinsert<cr>'),
        button('f', '  Find file', ':Telescope find_files<cr>'),
        button('r', '  Recent files', ':Telescope oldfiles<cr>'),
        button('g', '  Find word', ':Telescope live_grep<cr>'),
        button('c', '  Configuration', ':e $MYVIMRC | :cd %:p:h<cr>'),
        button('sl', '  Open last session'),
      },
      opts = {
        spacing = 1,
      },
    },

    footer = {
      type = 'text',
      val = '',
      opts = {
        position = 'center',
        hl = 'AlphaFooter',
      },
    },
  }

  for _, value in ipairs(section.buttons.val) do
    value.opts.hl = 'AlphaButton'
    value.opts.hl_shortcut = 'AlphaShortcut'
  end

  if vim.o.filetype == 'lazy' then
    vim.cmd.close()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaReady',
      callback = function()
        require('lazy').show()
      end,
    })
  end

  require('alpha').setup {
    layout = {
      { type = 'padding', val = 6 },
      section.header,
      { type = 'padding', val = 2 },
      section.buttons,
      { type = 'padding', val = 1 },
      section.footer,
    },
    opts = {
      margin = 5,
    },
  }

  vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyVimStarted',
    callback = function()
      local stats = require('lazy').stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      section.footer.val = 'Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
