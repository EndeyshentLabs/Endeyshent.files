function AdjustFontSize(a)
  vim.g.guifontsize = vim.g.guifontsize + a
  vim.opt.guifont = vim.g.guifont .. ":h" .. vim.g.guifontsize
end
