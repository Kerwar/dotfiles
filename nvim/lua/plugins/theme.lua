return {
  "ribru17/bamboo.nvim",
  dependencies = {
    'uloco/bluloco.nvim',
    'rktjmp/lush.nvim',
  },
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme("bluloco")
    -- vim.cmd.colorscheme("bamboo")
  end,
}
