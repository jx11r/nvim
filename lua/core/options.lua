local opt = vim.opt
local g = vim.g

-- disable optional providers
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- leader key
g.mapleader = ' '
g.maplocalleader = ' '

-- general options
opt.backup = false
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menu,menuone,noselect'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.ignorecase = true
opt.iskeyword:append '-'
opt.lazyredraw = true
opt.smartcase = true
opt.swapfile = false
opt.title = false
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false

-- user interface
opt.cmdheight = 1
opt.cursorline = false
opt.fillchars:append { eob = ' ' }
opt.hidden = true
opt.laststatus = 0
opt.number = true
opt.numberwidth = 4
opt.relativenumber = false
opt.ruler = false
opt.showmode = false
opt.showcmd = true
opt.splitbelow = true
opt.splitright = true
opt.signcolumn = 'yes:1'
opt.termguicolors = true

-- mouse support
opt.mouse = 'a'
opt.mousescroll = 'ver:3,hor:6'
opt.scrolloff = 10
opt.sidescrolloff = 10

-- indenting
opt.autoindent = true
opt.expandtab = true
opt.linebreak = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.wrap = true

-- neovide
if g.neovide then
  opt.guifont = 'FiraCode Nerd Font:h10'
  g.neovide_hide_mouse_when_typing = true
  -- g.neovide_cursor_animation_length = 0
end
