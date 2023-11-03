-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.title = true
vim.opt.colorcolumn = "120"
vim.opt.exrc = true -- unsafe
vim.g.defaultguifontsize = 13
vim.g.guifontsize = vim.g.defaultguifontsize
vim.g.guifont = "VictorMono Nerd Font"
vim.opt.guifont = vim.g.guifont .. ":h" .. vim.g.guifontsize
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_transparency = 0.99
  vim.cmd.source("~/.config/old-lvim/neovide_resize.lua")
  vim.cmd([[map! <S-Insert> <C-R>+]])
  vim.cmd([[map <silent> <F11> <cmd>let g:neovide_fullscreen=!g:neovide_fullscreen<CR>]])
end
