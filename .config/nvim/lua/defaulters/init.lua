local M = {}
local theme = require('defaulters.theme')

M.setup = function()
  vim.o.background = 'dark'
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'defaulters'

  theme.set_highligths()
end

return M
