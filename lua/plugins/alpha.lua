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

function M.opts()
  local button = require('alpha.themes.dashboard').button
  return {
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
end

function M.config(_, opts)
  for _, value in ipairs(opts.buttons.val) do
    value.opts.hl = 'AlphaButton'
    value.opts.hl_shortcut = 'AlphaShortcut'
  end

  if vim.o.filetype == 'lazy' then
    vim.cmd.close()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaReady',
      callback = function()
        if not vim.g.bootstrap then
          require('lazy').show()
        end
      end,
    })
  end

  require('alpha').setup {
    layout = {
      { type = 'padding', val = 6 },
      opts.header,
      { type = 'padding', val = 2 },
      opts.buttons,
      { type = 'padding', val = 1 },
      opts.footer,
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
      opts.footer.val = 'Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
