-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- Adds git related signs to the gutter, as well as utilities for managing changes
-- return {
-- 	-- See `:help gitsigns` to understand what the configuration keys do
-- 	"lewis6991/gitsigns.nvim",
-- 	opts = {
-- 		signs = {
-- 			add = { text = "+" },
-- 			change = { text = "~" },
-- 			delete = { text = "_" },
-- 			topdelete = { text = "‾" },
-- 			changedelete = { text = "~" },
-- 		},
-- 	},
-- }
return {
  "mhinz/vim-signify",
  lazy = false,
  keys = {
    { "<leader>shk", ":SignifyHunkDiff<CR>", desc = "SignifyHunkDiff", silent = true },
  },
}
