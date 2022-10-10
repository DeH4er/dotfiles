-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.opt.compatible = false
vim.opt.colorcolumn = '81'
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.shiftround = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.mousehide = true
vim.opt.cursorline = true
vim.opt.scrolloff = 3
vim.opt.listchars = { tab = '› ', trail = '•', extends = '#', nbsp = '.' }
vim.opt.list = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.updatetime = 300
vim.opt.showtabline = 1
vim.opt.signcolumn = 'yes'
vim.cmd([[
  au TermClose * exe 'bd!'
]])
