-- Allows the moving from function to function. The toggle allows to see all the functions
-- from the current file.
return {
  "stevearc/aerial.nvim",
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "{", ":AerialNext<CR>", desc = "AerialNext", silent = true },
    { "}", ":AerialPrev<CR>", desc = "AerialPrev", silent = true },
    { "<leader>a", ":AerialToggle<CR>", desc = "AerialToggle", silent = true },
  },
}
