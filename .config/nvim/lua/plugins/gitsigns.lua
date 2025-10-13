-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  -- See `:help gitsigns` to understand what the configuration keys do
  "lewis6991/gitsigns.nvim",
  version = "*",
  lazy = false,
  keys = {
    {
      ']c',
      function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          require("gitsigns").nav_hunk('next')
        end
      end,
      desc = "Next Change"
    },

    {
      '[c',
      function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          require("gitsigns").nav_hunk('prev')
        end
      end,
      desc = "Previous Change"
    },

    -- Actions
    { '<leader>hs', "<cmd> Gitsigns stage_hunk<cr>",                desc = "Stage Hunk" },
    { '<leader>hr', "<cmd> Gitsigns reset_hunk<cr>",                desc = "Reset Hunk" },

    { '<leader>hS', "<cmd> Gitsigns stage_buffer<cr>",              desc = "Stage Buffer" },
    { '<leader>hR', "<cmd> Gitsigns reset_buffer<cr>",              desc = "Reset Buffer" },
    { '<leader>hp', "<cmd> Gitsigns preview_hunk<cr>",              desc = "Preview Hunk" },
    { '<leader>hi', "<cmd> Gitsigns preview_hunk_inline<cr>",       desc = "Preview Hunk Inline" },
    { '<leader>hb', "<cmd> Gitsigns blame_line<cr>",                desc = "Blame Line" },
    { '<leader>hd', "<cmd> Gitsigns diffthis<cr>",                  desc = "Diff This" },
    { '<leader>hD', "<cmd> Gitsigns diffthis '~'<cr>",              desc = "Diff This ~" },
    { '<leader>hq', "<cmd> Gitsigns setqflist<cr>",                 desc = "Set QF List" },
    { '<leader>hQ', "<cmd> Gitsigns setqflist 'all'<cr>",           desc = "Set QF List (All)" },

    { '<leader>tb', "<cmd> Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Current Line Blame" },
    { '<leader>tw', "<cmd> Gitsigns toggle_word_diff<cr>",          desc = "Toggle Word Diff" },
  },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
}
-- return {
--   "mhinz/vim-signify",
--   version = "*",
--   lazy = false,
--   keys = {
--     { "<leader>shk", ":SignifyHunkDiff<CR>", desc = "SignifyHunkDiff", silent = true },
--   },
-- }
