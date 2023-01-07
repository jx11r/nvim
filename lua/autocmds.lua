-- close filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'lspinfo',
    'startuptime',
  },
  callback = function(e)
    vim.bo[e.buf].buflisted = false
    vim.keymap.set('n', 'q', ':close<cr>', { buffer = e.buf, silent = true })
  end,
})
