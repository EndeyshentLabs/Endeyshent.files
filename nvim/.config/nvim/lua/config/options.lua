-- Options. Loaded before lazy.nvim

local opt = vim.opt
local g = vim.g

g.autoformat = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.title = true
opt.colorcolumn = "120"
opt.exrc = true -- unsafe
g.defaultguifontsize = 13
g.guifontsize = g.defaultguifontsize
g.guifont = "VictorMono Nerd Font"
opt.guifont = g.guifont .. ":h" .. g.guifontsize
opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
