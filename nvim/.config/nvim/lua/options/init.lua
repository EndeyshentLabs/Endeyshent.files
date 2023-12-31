local g = vim.g
local set = vim.opt

set.number = true
set.relativenumber = true

set.signcolumn = "yes"

set.mouse = "a"

set.title = true

set.showcmd = true
set.showmode = false

set.smartindent = true
set.smartcase = true

set.smarttab = true
set.autoindent = true
set.expandtab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4

set.termguicolors = true
set.background = "dark"
g.guifont = "VictorMono Nerd Font"
g.guifontsize = 12
AdjustFontSize(0)

set.showmatch = true
set.incsearch = true
set.hlsearch = true

set.splitright = true
set.splitbelow = true

set.undofile = true

set.cursorline = true

set.scrolloff = 8

set.backup = false
set.writebackup = false
set.swapfile = false

set.updatetime = 50

set.clipboard = "unnamedplus"

vim.cmd([[filetype indent plugin on]])

g.mapleader = " "
g.maplocalleader = " "
