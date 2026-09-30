local opt = vim.opt
local g = vim.g

-- disable optional providers
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- leader key
g.mapleader = " "
g.maplocalleader = " "

-- general
opt.confirm = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.timeoutlen = 300
opt.updatetime = 200
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.iskeyword:append("-")

-- interface
opt.title = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.termguicolors = true
opt.signcolumn = "yes:1"
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.showmode = false
opt.showcmd = true
opt.ruler = false
opt.cmdheight = 1
opt.laststatus = 3
opt.fillchars:append({ eob = " " })

-- navigation
opt.mouse = "a"
opt.mousescroll = "ver:3,hor:6"
opt.smoothscroll = true
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.cursorline = true

-- indentation, wrapping
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true
opt.smartindent = true
opt.wrap = true
opt.linebreak = true
