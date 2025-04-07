return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  tag = "0.1.8",
  config = function()
    vim.keymap.set("n", "<space>ep", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)

    require "config.telescope.multigrep".setup()
  end,
  keys = {
    { "<leader>fd", require('telescope.builtin').find_files },
    { "<leader>fh", require('telescope.builtin').help_tags },
    { "<leader>en", function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath("config") } end },
  }
}
