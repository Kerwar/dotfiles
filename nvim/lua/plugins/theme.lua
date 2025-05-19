return {
  "ribru17/bamboo.nvim",
  dependencies = {
    'uloco/bluloco.nvim',
    {
      "rose-pine/neovim",
      name = "rose-pine",
    }, 'rktjmp/lush.nvim',
  },
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme("rose-pine")
    -- vim.cmd.colorscheme("bamboo")
  end,
}
