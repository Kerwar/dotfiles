require("config.options")
local color = require("defaulters")
color.setup()
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cc' },
  callback = function() vim.treesitter.start() end,
})
require("config.lazy")
require("config.keymaps")
