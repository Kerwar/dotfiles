vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.confirm = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.cursorline = true

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
