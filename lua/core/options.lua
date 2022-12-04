local opt = vim.opt

-- General
opt.ignorecase = true
opt.laststatus = 3
opt.lazyredraw = true
opt.smartcase = true
opt.title = true

-- System Utilities
opt.backup = false
opt.clipboard = 'unnamedplus'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.swapfile = false
opt.undofile = true
opt.writebackup = false

-- User Interface
opt.cursorline = false
opt.fillchars:append { eob = ' ' }
opt.hidden = true
opt.number = true
opt.numberwidth = 4
opt.relativenumber = false
opt.ruler = false
opt.showmode = false
opt.showcmd = true
opt.signcolumn = 'number'
opt.termguicolors = true

-- Mouse Support
opt.mouse = 'a'
opt.mousescroll = 'ver:3,hor:6'
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation
opt.autoindent = true
opt.expandtab = true
opt.linebreak = true
opt.shiftwidth = 2
opt.smartindent = false
opt.tabstop = 2
opt.wrap = true
