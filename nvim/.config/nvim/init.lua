-- Preload LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

function AdjustFontSize(a)
  vim.g.guifontsize = vim.g.guifontsize + a
  vim.opt.guifont = vim.g.guifont .. ":h" .. vim.g.guifontsize
end

require("options")

if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_transparency = 0.99
  vim.cmd([[map! <S-Insert> <C-R>+]])
  vim.cmd([[map <silent> <F11> <cmd>let g:neovide_fullscreen=!g:neovide_fullscreen<CR>]])
  vim.keymap.set("n", "<C-+>", "<cmd>lua AdjustFontSize(1)<CR>", { desc = "Increase font size" })
  vim.keymap.set("n", "<C-->", "<cmd>lua AdjustFontSize(-1)<CR>", { desc = "Decrease font size" })
  vim.keymap.set("n", "<C-=>", "<cmd>lua vim.opt.guifont = 'VictorMono Nerd Font:h12'<CR>", { desc = "Reset font" })
end

require("lazy").setup("plugins")

vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy" })
